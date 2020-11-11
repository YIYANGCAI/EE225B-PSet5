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

lucy = deconvblind(Blurred,PSF,5);
figure(2);
imshow(lucy);
title('Restored Image, NUMIT = 5');
imwrite(lucy,'ResultB.png');

lucy = deconvblind(Blurred,PSF,100);
figure(3);
imshow(lucy);
title('Restored Image, NUMIT = 100');
imwrite(lucy,'ResultC.png');

lucy = deconvblind(Blurred,PSF,300);
figure(4);
imshow(lucy);
title('Restored Image, NUMIT = 300');
imwrite(lucy,'ResultD.png');