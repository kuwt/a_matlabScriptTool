
refplane = load('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\5\ROI_pc2.txt');
data = load('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\5\ROI_pc.txt');

[averageDist, refplaneSD, planeSD] = planePlaneDistance(refplane,data)