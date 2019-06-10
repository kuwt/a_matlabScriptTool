offset = 0;
phaseshift= 0;
attenuate = 1;
background = 0;
period = 500;
life = period * 10;
%phaseshift= 0;

t = 1 : life;
s1 = cos (2*pi*t/period + offset);
s2 = attenuate * cos (2*pi*t/period+ offset + phaseshift) + background;                        
figure(1); clf;
plot (t,s1, t,s2);
Axis_x = -length(s1)+1 : 1 : length(s1)-1;               
cross_corr = xcorr(s1,s2,'coeff');                       
figure(2); clf;
% don't panic if you see that it is not a cosine
% this is due to the fact that it is a finite signal, leading to
% attenuation.
% If it can be an infinite signal, it will be a perfect cosine.
plot( Axis_x, cross_corr,'r');