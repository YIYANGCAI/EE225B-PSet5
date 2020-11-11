im1 = imread('./NoisyImg.bmp');
[row, col] = size(im1);
figure(1);
imshow(im1)

% Implement the median filter
im_median = medfilt2(im1,[3,3]);
figure(2);
imshow(im_median);
imwrite(im_median, 'Median.bmp')

% Implement the wiener filter
im_wiener = wiener2(im1, [5,5]);
figure(3);
imshow(im_wiener);
imwrite(im_wiener, 'Wiener.bmp')

% Implement the adaptive median filter
im_adp_median = adp_median(im1, 23);
figure(4);
imshow(im_adp_median);
imwrite(im_wiener, 'AdaptiveMedian.bmp');

% combination
im_out = adp_median(im1, 23);
im_out = wiener2(im_out, [3,3]);
figure(5);
imshow(im_out);
imwrite(im_wiener, 'ResultA.bmp');