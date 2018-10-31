clear all
clc
close all

addpath(genpath('pics/'));
im1 = imread('8.jpeg');
im2 = imread('9.jpeg');

ave1 = uint8(mean(im1, 3));
ave2 = uint8(mean(im2, 3));
% figure; imshow(ave1);
% figure; imshow(ave2);

diff = double(ave1) - double(ave2);

figure;imshow(diff,[]);
figure;
histogram(diff,30); title('Luminance Difference Image');
xlabel('RGB Luminance Value')
ylabel('Count of Pixels')

std_diff = std2(diff);
mean_diff = mean2(diff);
noise = std_diff / mean_diff;