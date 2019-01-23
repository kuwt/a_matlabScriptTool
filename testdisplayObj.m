obj = readObj('validShape_0.obj');
  
figure
for i=1:size(obj.v,1)
        if mod(i,20) == 1
             pt = obj.v(i,:);
            drawPoint(pt)
            hold on
        end
end
 