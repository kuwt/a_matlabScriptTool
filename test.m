squareSizeInMM = 25;
imageSize = [2448,2048];
%imageSize = [1024,1024];
boardSize = [11,8];
count = 14;

%
% get camera corners
%
B = [];
for i = 0:count
    str_e = sprintf('in/Camera_Chessboard_corners_%d.txt',i);
    fid = fopen(str_e,'rt');
    C = textscan(fid, '%f%f');
    fclose(fid);
    A = cell2mat(C);
    B = cat(3,B,A);
end
cam_imagePoints = B;

%
% get projector corners
%
B = [];
for i = 0:count
    str_e = sprintf('in/Proj_Chessboard_corners_%d.txt',i);
    fid = fopen(str_e,'rt');
    C = textscan(fid, '%f%f');
    fclose(fid);
    A = cell2mat(C);
    B = cat(3,B,A);
end 
proj_imagePoints = B;

%
% calibrate camera
%
worldPoints = generateCheckerboardPoints(boardSize,squareSizeInMM);
params = estimateCameraParameters(cam_imagePoints,worldPoints);
%show reprojection error
showReprojectionErrors(params);
% show figure plot
figure;
showExtrinsics(params);
hold off

% show reprojection images
% for i = 0:count
%     figure; 
%     blankimage = ones(imageSize(1),imageSize(2),3);
%     imshow(blankimage); 
%     hold on;
%     plot(imagePoints(:,1,i+1), imagePoints(:,2,i+1),'go');
%     plot(params.ReprojectedPoints(:,1,i+1),params.ReprojectedPoints(:,2,i+1),'r+');
%     legend('Detected Points','ReprojectedPoints');
%     str_e = sprintf('log/reproject_%d.png',i);
%     saveas(gcf,str_e)
%     hold off;
% end

%
% assign matrix [x y z px py]
%
worldPointswZ = [worldPoints,zeros(size(worldPoints,1),1)];
numOfCounts = count + 1;
tmp = [];
for i = 1:numOfCounts
    worldPointsInCamFrm =  worldPointswZ * params.RotationMatrices(1:3,1:3,i) + params.TranslationVectors(i,1:3);
    proj_imagePoints_per_count = proj_imagePoints(1:size(worldPoints,1),1:2,i);
    tmp = cat(3,tmp,[worldPointsInCamFrm,proj_imagePoints_per_count]);
end
xyzpxpy = tmp;

%
% assign matrix to solve
%
k1 = 1/100;
k2 = 1/100;
k3 = 1/500;
k4 = 1/1024;
numOfPoints = size(worldPoints,1);
tmp = [];
for i=1:numOfCounts
    for j = 1:numOfPoints
        x = xyzpxpy(j,1,i) * k1;
        y = xyzpxpy(j,2,i) * k2;
        z = xyzpxpy(j,3,i) * k3;
        px =  xyzpxpy(j,4,i) * k4;
        %py = xyzpxpy(j,5,i);
        %tmprow = [px*x,x,px*y,y,px*z,z, px,1];
        tmprow = [x, y, z, px, 1];
        tmp =  [tmp;tmprow];
    end
end

A = tmp;
[U,D,V] = svd(A);
sol= V(:,end);

% residue
res_s = [];
a = sol(1) * k1;
b = sol(2) * k2;
c = sol(3) * k3;
for i = 1:size(xyzpxpy,1)
    for j = 1:size(xyzpxpy,3)
        phi = xyzpxpy(i,4,j);
        d = sol(4) * k4 * phi + sol(5);
        res = a * xyzpxpy(i,1,j) + b * xyzpxpy(i,2,j) + c * xyzpxpy(i,3,j) + d;
        rms = sqrt(a * a + b* b + c * c);
        res = abs(res)/ rms;
        %txt = sprintf('a = %f | b = %f |c = %f| d = %f| res = %f', a,b,c,d,res)
        res_s = [res_s,res];
    end
end
mean_res = mean(res_s);
max_res = max(res_s);
min_res = min(res_s);
figure;
histogram(res_s)
txt = sprintf('mean_res. max_res. min_res = %f, %f, %f', mean_res, max_res, min_res)

% test plane 
figure;
showExtrinsics(params);
hold on
a = sol(1) * k1;
b = sol(2) * k2;
c = sol(3) * k3;
txt = sprintf('a. b. c = %f, %f, %f', a, b, c)
for i = 1:11
%   a = (sol(1) * k4 * phi + sol(2)) * k1;
%   b = (sol(3) * k4 * phi + sol(4)) * k2;
%   c = (sol(5) * k4 * phi + sol(6)) * k3;
%   d = (sol(7) * k4 * phi + sol(8));
    phi = (i -1) * 100;
    d = sol(4) * k4 * phi + sol(5);

    [y,z]=meshgrid(-50:150,100:600);
    x = -(d + b * y + c * z) / a;
    surf(x,z,y,'FaceColor','blue','edgecolor','none')
    alpha 0.1
    hold on
end

%for i = 1:numOfPoints
for i = 1:1
    x = xyzpxpy(i,1,1);
    y = xyzpxpy(i,2,1);
    z = xyzpxpy(i,3,1);
    scatter3(x,z,y);
    hold on
end
hold off

