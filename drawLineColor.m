function drawLineColor(v,pt,extension, RGB255)
     coord1 = pt;
     a = extension;
     coord2 = pt + a * v;
     
     rgb1 = RGB255/255;
     plot3([coord1(1) coord2(1)], [coord1(2) coord2(2)], [coord1(3) coord2(3)], '-','Color', rgb1)
end