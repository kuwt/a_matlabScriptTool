squareSizeInMM = 25;
%imageSize = [2448,2048];
imageSize = [1024,1024];
boardSize = [11,8];
count = 14;

B = [];
for i = 0:count
    %str_e = sprintf('in/Camera_Chessboard_corners_%d.txt',i);
    str_e = sprintf('in/Proj_Chessboard_corners_%d.txt',i);
    fid = fopen(str_e,'rt');
    C = textscan(fid, '%f%f');
    fclose(fid);
    A = cell2mat(C);
    B = cat(3,B,A);
end

imagePoints = B;
worldPoints = generateCheckerboardPoints(boardSize,squareSizeInMM);
%params = estimateCameraParameters(imagePoints,worldPoints,'NumRadialDistortionCoefficients' ,3);
params = estimateCameraParameters(imagePoints,worldPoints);
%show reprojection error
showReprojectionErrors(params);
% show figure plot
figure;
showExtrinsics(params);
% show reprojection images
for i = 0:count
    figure; 
    blankimage = ones(imageSize(1),imageSize(2),3);
    imshow(blankimage); 
    hold on;
    plot(imagePoints(:,1,i+1), imagePoints(:,2,i+1),'go');
    plot(params.ReprojectedPoints(:,1,i+1),params.ReprojectedPoints(:,2,i+1),'r+');
    legend('Detected Points','ReprojectedPoints');
    str_e = sprintf('log/reproject_%d.png',i);
    saveas(gcf,str_e)
    hold off;
end
