clear all
clc
close all

addpath(genpath('pics/'));
img = imread('low2.jpg');

im = rgb2gray(img);
im = im2double(im);

figure(1); imshow(im, 'InitialMagnification','fit');
title('Original image');

b = 0.25;
% b = 0.1;

[outfreq, H, MSEf] = freqdomain(im, im, b);
[outspace, h, MSEw] = spacedomain(im, b, H);

%% call function with various beta value and plot MSE with each method

% for b = 0.1 : 0.2 :10
%     [outfreq, H, MSEf] = freqdomain(im, im, b);
%     [outspace, h, MSEw] = spacedomain(im, b, H);
%     i = ceil(b * 10 / 2);
%     z(1,i) = b;
%     z(2,i) = MSEf;
%     z(3,i) = MSEw;
% end
% 
% figure; plot(z(1,:),z(2,:));
% hold on
% plot(z(1,:),z(3,:));
% legend('Frequency domain','Space domain');
% title('Mean Squared Error v.s. Beta');
% xlabel('Beta');
% ylabel('MSE');