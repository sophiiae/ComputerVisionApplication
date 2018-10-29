clear all
clc
close all

addpath(genpath('pics/'));
im = imread('1.jpeg');

% im -- RGB image,
% top, bottom, left, right -- boundary of rectangular region (px)
% first average the RGB values at each pixel to produce a luminance image

% figure, imagesc, mean, std, double.
top = 500;
bottom = 900;
left = 500;
right = 800;

%=============function below =======================
im = imcrop(im, [left top right bottom]);
% red = im(:,:,1);
% green = im(:,:,2);
% blue = im(:,:,3);

imAve = uint8(mean(im, 3));
imshow(imAve);

figure; 
x = [left right];
y = [top bottom];
imagesc(x, y, imAve); colorbar;
colormap default

% Plot a histogram of the luminance values.
% histogram,title, set, xlabel,ylabel, axis,
figure;
histogram(imAve);
title('Luminance values');
xlabel('RGB Luminance Value')
ylabel('Count of Pixels')
axis([160 195 0 120000]);

% report the standard deviation of this luminance image,
% normalized (divided) by the mean luminance.
meanv = mean2(imAve);
stdv = std2(imAve);
noise = stdv / meanv;
% normalizedIm = imAve ./ meanv;
% figure; imagesc(x, y, normalizedIm); colorbar;