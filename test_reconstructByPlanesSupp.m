% Run after test_reconstructByPlanesCont.m

h = 465;
w = 972;
%genrrate projector plane
phi =  HMap(h,w);
a = heq(1);
b = heq(2);
c = heq(3);
d = heq(4) * phi + heq(5);

figure;
showExtrinsics(params);
hold on

[x,z]=meshgrid(-150:150,100:600);
y = -(d + a * x + c * z) / b;
surf(x,z,y,'FaceColor','blue','edgecolor','none')
alpha 0.1
hold on

cam_p = [0;0;0];
cam_v = Kinv * [w;h;1];

t = 0:600;
x = cam_p(1) + t * cam_v(1) ;
y = cam_p(2) + t * cam_v(2) ;
z = cam_p(3) + t * cam_v(3) ;
%plot3(pt1(1),pt1(3),pt1(2),pt2(1),pt2(3),pt2(2));
plot3(x,z,y);
hold on
%put y = 0, z = 500
x = (-d - c * 500)/a;

proj_n = [a;b;c]/sqrt(a*a + b*b + c*c);
proj_p = [x;0;500];

epsilon = 0.005;
denom = dot(proj_n,cam_v);
numer = dot(proj_n,proj_p - cam_p);
lambda = numer/denom;
pt = lambda * cam_v + cam_p;

scatter3(pt(1),pt(3),pt(2));
hold on