function [k b] = regression(x,y)
A = sum(x.*x);
B = sum(x);
C = sum(x.*y);
D = sum(y);
tmp = (A*size(x,2)- B*B);
k = (C*size(x,2) - B*D) / tmp;
b = (A*D - C*B) / tmp;