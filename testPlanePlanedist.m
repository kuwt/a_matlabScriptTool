
refplane = load('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\reconstructionAlgorithm\TestAlgorithm\log\ROI_pc2.txt');
data = load('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\reconstructionAlgorithm\TestAlgorithm\log\ROI_pc.txt');

[averageDist, refplaneNormal, refplaneSD] = planePlaneDistanceRansac(refplane,data);
txt = sprintf('refplaneSD = %f', refplaneSD)
txt = sprintf('averageDist = %f', averageDist)
