%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
img = imread('0002.bmp');
figure('NumberTitle', 'off', 'Name', 'input');
imshow(img)
%%%%%%%%%%  fft  %%%%%%%%%%
F = fftshift(fft2(img));
mn = size(img,1) * size(img,2);
figure('NumberTitle', 'off', 'Name', 'F/mn');
imagesc(abs(F/mn))

%%%%%%%%%%  construct filter  %%%%%%%%%%
filter = ones(size(img));
for h = 1 : size(img,1)
    for w = 1 :  size(img,2)
        if w >= 638
            filter(h,w) = 0;
        end
    end
end
FFed = F .* filter; 

figure('NumberTitle', 'off', 'Name', 'FFed/mn');
imagesc(abs(FFed/mn))

%%%%%%%%%%  inverse fft  %%%%%%%%%%
iF = ifft2(ifftshift(F));
figure('NumberTitle', 'off', 'Name', 'iF');
imagesc(abs(iF))

%%%%%%%%%%  inverse fft for filtered image  %%%%%%%%%%
iFFed = ifft2(ifftshift(FFed));
figure('NumberTitle', 'off', 'Name', 'iFFed');
imagesc(abs(iFFed))

%%%%%%%%%%  phi image  %%%%%%%%%%
phi = atan2(imag(iFFed),real(iFFed));
figure('NumberTitle', 'off', 'Name', 'phi');
imagesc(phi)