function [averageDist, refplaneNormal, refplaneSD, planeNormal, planeSD] = planePlaneDistance(refplane,plane)
   
    %averageDist
    [n,~,p] = affine_fit(refplane);
    NumOfPoints = size(plane,1);
    dists = zeros(NumOfPoints,1);

    for i=1:NumOfPoints
        pt = plane(i,:);
        dists(i) = point_plane_shortest_dist_vec(n(1),n(2),n(3),p(1),p(2),p(3),pt(1),pt(2),pt(3));
    end    
     averageDist = mean(dists);
     
     %refplaneSD
    [n,~,p] = affine_fit(refplane);
    NumOfPoints = size(refplane,1);
    dists = zeros(NumOfPoints,1);
     for i=1:NumOfPoints
        pt = refplane(i,:);
        dists(i) = point_plane_shortest_dist_vec(n(1),n(2),n(3),p(1),p(2),p(3),pt(1),pt(2),pt(3));
    end    
     refplaneSD = std(dists);
     refplaneNormal = n;
     
       %planeSD
      [n,~,p] = affine_fit(plane);
    NumOfPoints = size(plane,1);
    dists = zeros(NumOfPoints,1);
     for i=1:NumOfPoints
        pt = plane(i,:);
        dists(i) = point_plane_shortest_dist_vec(n(1),n(2),n(3),p(1),p(2),p(3),pt(1),pt(2),pt(3));
    end    
     planeSD = std(dists);
     planeNormal = n;
end

