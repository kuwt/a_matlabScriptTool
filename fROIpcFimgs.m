ZMap = imread('D:/sourcecode/FaceScanning/reconstruction/face_scanner_src/CalibrationV1\Calibration/log/ZMap.tif');
YMap = imread('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\YMap.tif');
XMap = imread('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\XMap.tif');

ROI_TopLeftx = 434;
ROI_TopLefty = 370;
ROI_Sizex = 20;
ROI_Sizey = 20;

ROI_TopLeftx2 = 407;
ROI_TopLefty2 = 435;
ROI_Sizex2 = 60;
ROI_Sizey2 = 60;


Eff_ROI_TopLeftx = ROI_TopLeftx + 1;
Eff_ROI_TopLefty = ROI_TopLefty + 1;
Eff_ROI_BotRightx = Eff_ROI_TopLeftx + ROI_Sizex;
Eff_ROI_BotRighty = Eff_ROI_TopLefty + ROI_Sizey;
ZMap(Eff_ROI_TopLefty,Eff_ROI_TopLeftx)
fileID = fopen('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\ROI_pc.txt','w');
formatSpec = '%f\t%f\t%f\n';
for x=Eff_ROI_TopLeftx:Eff_ROI_BotRightx
    for y=Eff_ROI_TopLefty:Eff_ROI_BotRighty
      if (~isnan(ZMap(y,x)))
         fprintf(fileID, formatSpec, XMap(y,x), YMap(y,x), ZMap(y,x));
    end
end
fclose(fileID);

Eff_ROI_TopLeftx = ROI_TopLeftx2 + 1;
Eff_ROI_TopLefty = ROI_TopLefty2 + 1;
Eff_ROI_BotRightx = Eff_ROI_TopLeftx + ROI_Sizex2;
Eff_ROI_BotRighty = Eff_ROI_TopLefty + ROI_Sizey2;

fileID = fopen('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\ROI_pc2.txt','w');
formatSpec = '%f\t%f\t%f\n';
ZMap(Eff_ROI_TopLefty,Eff_ROI_TopLeftx)
for x=Eff_ROI_TopLeftx:Eff_ROI_BotRightx
    for y=Eff_ROI_TopLefty:Eff_ROI_BotRighty
        if (~isnan(ZMap(y,x)))
            fprintf(fileID, formatSpec, XMap(y,x), YMap(y,x), ZMap(y,x));
    end
end
fclose(fileID);


