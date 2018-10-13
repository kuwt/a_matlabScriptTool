
N = 60;
figure
x = linspace( 0 ,900);
y = 1-cos( 2*pi*x/N + pi);
plot(x,y,'r')

figure
x = linspace( 0 ,900);
y = (1-cos(2*pi*x/N+pi))/2;
plot(x,y,'r')

figure
x = linspace( 0 ,900);
ytemp = (1-cos(2*pi*x/N+pi)) /2;
ytemp2 = ytemp * (255 - 50) + 50;
y = uint8(floor(ytemp2));
plot(x,y,'r')