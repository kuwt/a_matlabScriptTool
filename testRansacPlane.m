refplane = load('D:\sourcecode\FaceScanning\reconstruction\face_scanner_src\CalibrationV1\Calibration\log\ROI_pc2.txt');
[pbest,n,ro] = ransac_tim(refplane,4,10,5,30);
pt = refplane(1,:);
point_plane_shortest_dist_n_ro(n(1),n(2),n(3),ro,pt(1),pt(2),pt(3))
