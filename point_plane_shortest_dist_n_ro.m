function v = point_plane_shortest_dist_n_ro(n1, n2, n3, ro, pt1, pt2, pt3)
% Point to plane shortest distance
% The plane is defined by: plane_normal, distance from origin to plane ro
% The point is defined by:pt
% output: distance from point pt to plane 

        
pt = [pt1,pt2,pt3];
N = [n1,n2,n3];

dist=dot(N,pt)-ro;
v = abs(dist);
end