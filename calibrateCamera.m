imageFileNames = {'0005.bmp', '0006.bmp', '0007.bmp'};
[imagePoints, boardSize] = detectCheckerboardPoints(imageFileNames);
squareSizeInMM = 25;
worldPoints = generateCheckerboardPoints(boardSize,squareSizeInMM);
imageSize = [2448,2048];
params = estimateCameraParameters(imagePoints,worldPoints);
%show reprojection error
showReprojectionErrors(params);
% show figure plot
figure;
showExtrinsics(params);
% show reprojection images
figure; 
imshow(imageFileNames{1}); 
hold on;
plot(imagePoints(:,1,1), imagePoints(:,2,1),'go');
plot(params.ReprojectedPoints(:,1,1),params.ReprojectedPoints(:,2,1),'r+');
legend('Detected Points','ReprojectedPoints');
hold off;
