
normal = [-0.380442 -0.0213104 -0.109824];
ptPlane = [98.7406 13.8678 26.3544];

vec =  [-0.044279 0.00704846 1];
ptLine = [-0.044279 0.00704846 1];

vec2 = [-0.280312 -0.0563035 0.982736];
ptLine2 = [98.743 13.6498 26.3893];
intpt = [-17.2648 -3.15527 427.208];

figure
grid on
drawPlane(normal,ptPlane, -50,450)
hold on
drawLine(vec,ptLine,500)
hold on
drawLine(vec2,ptLine2,500)
hold on 
drawPoint(intpt)