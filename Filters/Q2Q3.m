clear all
clc
% close all

addpath(genpath('pics/'));
img = imread('x.jpg');
im = rgb2gray(img);
im = im2double(im);
[h, w] = size(im);

figure; imshow(im,'InitialMagnification','fit');
title('Original image');
sd = std(im(:));

noisy = imnoise(im, 'gaussian', 0, sd ^ 2);
% n = normrnd(0, sd, [h w]);
% noisy = im + n;
figure; imshow(noisy,'InitialMagnification','fit');
title('Noisy image');

b = 1;
[outwiener, H, MSEf] = freqdomain(im, noisy, b);
sigma = 1;
[outgauss, MSEg] = gaussfilter(im, noisy, sigma);

%% call function with various beta value and plot MSE with each method

% for b = 0.1 : 0.2 :10
%     [outfreq, H, MSEf] = freqdomain(im, noisy, b);
%     i = ceil(b * 10 / 2);
%     z(1,i) = b;
%     z(2,i) = MSEf;
% end
% 
% figure; plot(z(1,:),z(2,:));
% xlim([0.1 10]);
% legend('Frequency domain');
% title('Mean Squared Error v.s. Beta');
% xlabel('Beta (From 0.1 to 10)');
% ylabel('MSE');


% for sigma = 0.1 : 0.2 :10
%     [outgauss, MSEg] = gaussfilter(im, noisy, sigma);
%     i = ceil(sigma * 10 / 2);
%     z(1,i) = sigma;
%     z(2,i) = MSEg;
% end
% 
% figure; plot(z(1,:),z(2,:));
% legend('Gaussian filter');
% title('Mean Squared Error v.s. Sigma');
% xlabel('Sigma');
% ylabel('MSE');

%% Q3 Bilateral fitler 

dos = sd ^ 2 * 6; 
outbi = imbilatfilt(noisy, dos, 3);
figure; imshow(outbi, 'InitialMagnification','fit'); 
title('bilateral gauss filtered image');
MSEb = immse(outbi, im);