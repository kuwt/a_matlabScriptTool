%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test Sampling Cosine and Nyquist frequency
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rows = 1024;
cols = 1280;
N = 8; % period 
shift = 0; % phase shift
yMax = 255;
yMin = 0;
scaleFactor = 3;

%%%%%%%%%%%%%%% main %%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate image
I1=uint8(zeros(rows,cols,1));
for c=1:cols
    temp = (1 + cos(2*pi*c / N + shift)) /2;
    temp2 = temp * (yMax - yMin) + yMin;
    I1(:,c,:)=uint8(floor(temp2));
end
I = I1;
I1 = imresize(I,scaleFactor,'nearest');
imwrite(I1,'src.bmp');

% fft
Fori = fft2(I1);
F = fftshift(fft2((I1)));
mn = size(I1,1) * size(I1,2);
figure('NumberTitle', 'off', 'Name', 'F/mn cosine');
imagesc(abs(F/mn))
figure;

Freal = real(Fori/mn);
Fimag = imag(Fori/mn);
Fabs = abs(Fori/mn);
subplot(3,1,1); plot(Fabs(1,1:end)); title('one row of fft magnitude');
subplot(3,1,2); plot(Freal(1,1:end)); title('one row of fft real');
subplot(3,1,3); plot(Fimag(1,1:end)); title('one row of fft imag');

