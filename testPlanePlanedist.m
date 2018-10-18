
refplane = load('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\ROI_pc2.txt');
data = load('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\ROI_pc.txt');

[averageDist, refplaneNormal, refplaneSD, planeNormal, planeSD] = planePlaneDistance(refplane,data)