% Find maximum response

% Template
I = im2double(imread('7.png'));
T=I(384:690,654:984,:); % y then x


I2 = im2double(imread('7.png'));
% Calculate SSD and NCC between Template and Image
[I_SSD,I_NCC]=template_matching(T,I2);
% Find maximum correspondence in I_SDD image
[x,y]=find(I_SSD==max(I_SSD(:)));
% Show result
figure, 
subplot(2,2,1), imshow(I2); hold on; plot(y,x,'r*'); title('Result')
subplot(2,2,2), imshow(T); title('The eye template');
subplot(2,2,3), imshow(I_SSD); title('SSD Matching');
subplot(2,2,4), imshow(I_NCC); title('Normalized-CC');