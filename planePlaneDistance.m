function [averageDist, refplaneNormal, refplaneSD] = planePlaneDistance(refplane,plane)
   
    %fitting
    [n,~,p] = affine_fit(refplane);
    
    %refplaneSD
    NumOfPoints = size(refplane,1);
    dists = zeros(NumOfPoints,1);
     for i=1:NumOfPoints
        pt = refplane(i,:);
        dists(i) = point_plane_shortest_dist_n_po(n(1),n(2),n(3),p(1),p(2),p(3),pt(1),pt(2),pt(3));
    end    
     refplaneSD = std(dists);
     refplaneNormal = n;
     
    %averageDist
    
    NumOfPoints = size(plane,1);
    dists = zeros(NumOfPoints,1);

    for i=1:NumOfPoints
        pt = plane(i,:);
        dists(i) = point_plane_shortest_dist_n_po(n(1),n(2),n(3),p(1),p(2),p(3),pt(1),pt(2),pt(3));
    end    
     averageDist = mean(dists);
    
    %plotting
   v = [n(1),n(2),n(3)]
   w = null(v) % Find two orthonormal vectors which are orthogonal to v
   [P,Q] = meshgrid(-50:50); % Provide a gridwork (you choose the size)
   X = p(1)+w(1,1)*P+w(1,2)*Q; % Compute the corresponding cartesian coordinates
   Y = p(2)+w(2,1)*P+w(2,2)*Q; %   using the two vectors in w
   Z = p(3)+w(3,1)*P+w(3,2)*Q;
   surf(X,Y,Z)
   hold on
    for i=1:NumOfPoints
        if mod(i,10) == 1
             pt = refplane(i,:);
            scatter3(pt(1),pt(2),pt(3))
        end
    end

end

