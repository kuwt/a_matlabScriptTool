function [k b err] = ordinaryLinearLeastSquare(x,y)

% get k and b
A = sum(x.*x);
B = sum(x);
C = sum(x.*y);
D = sum(y);
tmp = (A*size(x,2)- B*B);
k = (C*size(x,2) - B*D) / tmp;
b = (A*D - C*B) / tmp;

% get the root average square error 
[m,n] = size(x);
fprintf('len x = %d',n );
totalSqError = 0;
for i=1:n
    SinglePtErr = (k * x(i) + b) - y(i);
    sqSinglePtErr = SinglePtErr^2;
    totalSqError = totalSqError + sqSinglePtErr;
end
AvgSqErr = totalSqError / n;
rootAvgSqError = sqrt(AvgSqErr);
err = rootAvgSqError;