function drawPlane(n,pt,min,max)
       v = [n(1),n(2),n(3)];
       w = null(v); % Find two orthonormal vectors which are orthogonal to v
       [P,Q] = meshgrid(min:max); % Provide a gridwork (you choose the size)
       X =pt(1)+w(1,1)*P+w(1,2)*Q; % Compute the corresponding cartesian coordinates
       Y =pt(2)+w(2,1)*P+w(2,2)*Q; %   using the two vectors in w
       Z = pt(3)+w(3,1)*P+w(3,2)*Q;
       surf(X,Y,Z)
end