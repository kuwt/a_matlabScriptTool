
scale = 0.2;
vecX =  [0.999992 0.003956 0.000416];
vecY = [0.003954 -0.999987 0.003023];
vecZ = [0.000429 -0.003021 -0.999995];
ptLine = [0.022885 0.022626 0.042622];
color = [255 0 0];

vecX2 =  [-0.337276 0.766380 -0.546724];
vecY2 = [-0.386843 -0.642282 -0.661685];
vecZ2 = [-0.858253 -0.011674 0.513094];
ptLine2 = [-0.025603 0.202038 0.994343];
color2 = [0 255 0];

figure
grid on
drawLineColor(vecX,ptLine,scale,color )
hold on
drawLineColor(vecY,ptLine,scale,color)
hold on 
drawLineColor(vecZ,ptLine,scale,color)

drawLineColor(vecX2,ptLine2,scale,color2)
hold on
drawLineColor(vecY2,ptLine2,scale,color2)
hold on 
drawLineColor(vecZ2,ptLine2,scale,color2)
