% original image
img = imread('0000.bmp');
% fringe image
img1 = imread('0001.bmp');

figure('NumberTitle', 'off', 'Name', 'input');
imshow(img)

figure('NumberTitle', 'off', 'Name', 'img1');
imshow(img1)

% inverse fringe image
imgsub1 = img - img1;
figure('NumberTitle', 'off', 'Name', 'imgsub1');
imshow(imgsub1)
mkdir('log');
imwrite(imgsub1,'log\\imgsub1.bmp' );

% remove dc 
Id1 = double(img1) - double(imgsub1);
figure('NumberTitle', 'off', 'Name', 'Id1');
imagesc(Id1)

% fft
F = fftshift(fft2(Id1));
mn = size(Id1,1) * size(Id1,2);
figure('NumberTitle', 'off', 'Name', 'F/mn');
imagesc(abs(F/mn))

% filtered in transformed domain
filter = ones(size(img));
for h = 1 : size(img,1)
    for w = 1 :  size(img,2)
        if w <= 650
            filter(h,w) = 0;
        end
    end
end
FFed = F .* filter; 

figure('NumberTitle', 'off', 'Name', 'FFed/mn');
imagesc(abs(FFed/mn))

% ifft 
iF = ifft2(ifftshift(F));
figure('NumberTitle', 'off', 'Name', 'iF');
imagesc(abs(iF))

iFFed = ifft2(ifftshift(FFed));
figure('NumberTitle', 'off', 'Name', 'iFFed');
imagesc(abs(iFFed))

% phase image 
phi = atan2(imag(iFFed),real(iFFed));
figure('NumberTitle', 'off', 'Name', 'phi');
imagesc(phi)