clc;

I = imread('NoisyBlur.bmp');
figure(1);
imshow(I);
title('Original Image');

PSF = fspecial('gaussian',7,7);
Blurred = imfilter(I,PSF,'symmetric','conv');
%imshow(Blurred);
%title('Gaussian Blurred');
%imwrite(Blurred,'gaussian.png');

im1 = deconvblind(Blurred,PSF,5);
figure(2);
imshow(im1);
title('Restored Image, NUMIT = 5');
imwrite(im1,'ResultB.png');

im2 = deconvblind(Blurred,PSF,100);
figure(3);
imshow(im2);
title('Restored Image, NUMIT = 100');
imwrite(im2,'ResultC.png');

im3 = deconvblind(Blurred,PSF,300);
figure(4);
imshow(im3);
title('Restored Image, NUMIT = 300');
imwrite(im3,'ResultD.png');