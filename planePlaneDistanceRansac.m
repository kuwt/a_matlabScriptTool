function [averageDist, refplaneNormal, refplaneSD] = planePlaneDistanceRansac(refplane,plane)
     
    %fitting
    [pbest,n,ro,Xbest,Ybest,Zbest] = ransac_tim(refplane,4,10,5,30);
    
         %plotting
    isPlotting = 1;
    if isPlotting == 1
        figure
       v = [n(1),n(2),n(3)];
       w = null(v); % Find two orthonormal vectors which are orthogonal to v
       [P,Q] = meshgrid(-50:50); % Provide a gridwork (you choose the size)
       X =Xbest(1,1)+w(1,1)*P+w(1,2)*Q; % Compute the corresponding cartesian coordinates
       Y =Ybest(1,1)+w(2,1)*P+w(2,2)*Q; %   using the two vectors in w
       Z = Zbest(1,1)+w(3,1)*P+w(3,2)*Q;
       surf(X,Y,Z)

       hold on
        for i=1:size(refplane,1)
            if mod(i,20) == 1
                 pt = refplane(i,:);
                scatter3(pt(1),pt(2),pt(3), 20, [0.75 0 0])
            end
        end
         hold on
         for i=1:size(plane,1)
            if mod(i,20) == 1
                 pt = plane(i,:);
                scatter3(pt(1),pt(2),pt(3), 20, [0 0.75 0.75])
            end
        end
    end
    
     %refplaneSD
    NumOfPoints = size(pbest,1);
    dists = zeros(NumOfPoints,1);
     for i=1:NumOfPoints
        pt = pbest(i,:);
        dists(i) = point_plane_shortest_dist_n_ro(n(1),n(2),n(3),ro,pt(1),pt(2),pt(3));
    end    
     refplaneSD = std(dists);
     refplaneNormal = n;
    
    %averageDist
    [pbest_plane] = ransac_tim(plane,4,10,5,30);
    NumOfPoints = size(pbest_plane,1);
    dists = zeros(NumOfPoints,1);

    for i=1:NumOfPoints
        pt = pbest_plane(i,:);
        dists(i) = point_plane_shortest_dist_n_ro(n(1),n(2),n(3),ro,pt(1),pt(2),pt(3));
    end    
    averageDist = mean(dists);
end

