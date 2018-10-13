function v = point_plane_shortest_dist_vec(n1, n2, n3, pn1, pn2, pn3, pt1, pt2, pt3)
% Point to plane shortest distance vector
% The plane is defined by: plane_normal, plane_pt
% The point is defined by:pt
pn = [pn1,pn2,pn3];
pt = [pt1,pt2,pt3];
r = pt - pn;
N = [n1,n2,n3];
u = dot(r,N);
v = abs(u);
end