%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Test Sampling binary and Nyquist frequency
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


rows = 1024;
cols = 1280;
N = 3; % period 
shift = 0; % phase shift
yMax = 255;
yMin = 0;

%%%%%%%%%%%%%%% main %%%%%%%%%%%%%%%%%%%%%%%%%%

% Generate image
% binary wave
I1=uint8(zeros(rows,cols,1));
for c=1:cols
    remainder = rem(c,N);
    if remainder < N/2
        value = 255;
    else
        value = 0;
    end
    I1(:,c,:)=uint8(value); 
end
imwrite(I1,'srcbin.bmp');

% fft
Fori = fft2(I1);
F = fftshift(fft2((I1)));
mn = size(I1,1) * size(I1,2);
figure('NumberTitle', 'off', 'Name', 'F/mn binary');
imagesc(abs(F/mn))
figure;

Freal = real(Fori/mn);
Fimag = imag(Fori/mn);
Fabs = abs(Fori/mn);
subplot(3,1,1); plot(Fabs(1,1:end)); title('one row of fft magnitude');
subplot(3,1,2); plot(Freal(1,1:end)); title('one row of fft real');
subplot(3,1,3); plot(Fimag(1,1:end)); title('one row of fft imag');
