% reconstruction
% Run after test_reconstructByPlanes.m
%
%
VMap = imread('./in/finalpixelImageV.tif');
HMap = imread('./in/finalpixelImageH.tif');
colorMap = imread('./in/color.bmp');
InValidMap = imread('./in/IsValid_image.bmp');
K = params.IntrinsicMatrix;
Kinv = inv(K.');

XMap = zeros(size(VMap,1),size(VMap,2));
YMap = zeros(size(VMap,1),size(VMap,2));
ZMap = zeros(size(VMap,1),size(VMap,2));
ValidMap = zeros(size(VMap,1),size(VMap,2));
validPtcount = 0;
for h = 1:size(VMap,1)
    for w = 1: size(VMap,2)
        if (mod(h,100) == 0 || mod(w,100) == 0)
            sprintf('h=%d,w=%d',h,w)
        end
        
        if (InValidMap(h,w) < 1)
            continue
        end
        %generate camera ray
        %und_Points = undistortPoints([w,h],params)
        cam_p = [0;0;0];
        cam_v = Kinv * [w;h;1];

        %genrrate projector plane
        phi =   HMap(h,w);
        %[a,b,c,d] = test_reconstructByPlanes_plane_model_const(sol_h,ks_h,phi);
        [a,b,c,d] = test_reconstructByPlanes_plane_model_linear(  sol_h,ks_h,phi);
      
        %put y = 0, z = 500
        x = (-d - c * 500)/a;

        proj_n = [a;b;c]/sqrt(a*a + b*b + c*c);
        proj_p = [x;0;500];

        epsilon = 0.005;
        denom = dot(proj_n,cam_v);
        if (abs(denom) > epsilon)
            numer = dot(proj_n,proj_p - cam_p);
            lambda = numer/denom;
            pt = lambda * cam_v + cam_p;
            XMap(h,w) = pt(1);
            YMap(h,w) = pt(2);
            ZMap(h,w) = pt(3);
            ValidMap(h,w) = 1;
            validPtcount = validPtcount + 1;
        end
    end
end

imwrite2tif(XMap,[],'log/XMap.tiff','single');
imwrite2tif(YMap,[],'log/YMap.tiff','single');
imwrite2tif(ZMap,[],'log/ZMap.tiff','single');

pointcloud =  zeros(validPtcount,4);
cur_count = 1;
for h = 1:size(VMap,1)
    for w = 1: size(VMap,2)
        if (ValidMap(h,w) > 0)
            pointcloud(cur_count,1) = XMap(h,w);
            pointcloud(cur_count,2) = YMap(h,w);
            pointcloud(cur_count,3) = ZMap(h,w);
            pointcloud(cur_count,4) = colorMap(h,w);
            cur_count = cur_count+ 1;
        end
    end
end     

  
fileID = fopen('log/pc.obj','w');
for row = 1:size(pointcloud,1)
    fprintf(fileID,'v %f %f %f %f %f %f\n',pointcloud(row,1),pointcloud(row,2),pointcloud(row,3) ...
    ,pointcloud(row,4),pointcloud(row,4),pointcloud(row,4));
end
fclose(fileID);