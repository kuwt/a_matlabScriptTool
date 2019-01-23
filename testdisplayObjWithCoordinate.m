obj = readObj('validShape_1.obj');
figure
for i=1:size(obj.v,1)
        if mod(i,5) == 1
             pt = obj.v(i,:);
            drawPoint(pt)
            hold on
        end
end

obj2 = readObj('validShape_2.obj');
for i=1:size(obj2.v,1)
        if mod(i,5) == 1
             pt = obj2.v(i,:);
            drawPoint(pt)
            hold on
        end
end

% vector1q
scale = 0.1;
% vecAxis1 =  [0.000429 -0.003021 -0.999995];
% ptLine2 = [0.022885 0.022626 0.042622];
% color2 = [255 0 0];
% drawLineColor(vecAxis1,ptLine2,scale,color2)
% hold on
% drawPoint(ptLine2)
% hold on
% 
% % vector2q
% vecAxis2 =  [0.643805 0.000233 -0.765190];
% ptLine2 = [0.046096 0.023136 0.037255];
% color2 = [255 0 0];
% drawLineColor(vecAxis2,ptLine2,scale,color2)
% hold on 
% drawPoint(ptLine2)
% hold on

% frameq
% scale = 0.1;
% vecX2 =  [0.999992 0.003956 0.000416];
% vecY2 = [0.003954 -0.999987 0.003023];
% vecZ2 = [0.000429 -0.003021 -0.999995];
% ptLine2 = [0.022885 0.022626 0.042622];
% color2 = [0 0 0];
% drawLineColor(vecX2,ptLine2,scale,color2)
% hold on
% drawLineColor(vecY2,ptLine2,scale,color2)
% hold on 
% drawLineColor(vecZ2,ptLine2,scale,color2)

% vector1s
vecAxis1 =  [-0.833636 -0.551522 -0.029591];
ptLine2 = [0.015166 -0.113000 1.017197];
color2 = [0 255 0];
drawLineColor(vecAxis1,ptLine2,scale,color2)
hold on
drawPoint(ptLine2)
hold on
% vector2s
vecAxis2 =  [-0.978301 0.205397 -0.027180];
ptLine2 = [0.018445 -0.132284 1.013885];
color2 = [0 255 0];
drawLineColor(vecAxis2,ptLine2,scale,color2)
hold on 
drawPoint(ptLine2)
hold on
% frames
% scale = 0.1;
% vecX2 =  [-0.341689 0.787143 -0.513473];
% vecY2 = [-0.375824 -0.615212 -0.693016];
% vecZ2 = [-0.861397 -0.043821 0.506039];
% ptLine2 = [-0.026152 0.201979 0.993605];
% color2 = [0 0 0];
% drawLineColor(vecX2,ptLine2,scale,color2)
% hold on
% drawLineColor(vecY2,ptLine2,scale,color2)
% hold on 
% drawLineColor(vecZ2,ptLine2,scale,color2)
%  