clear all
clc
close all

addpath(genpath('pics/'));
im1 = imread('1.jpeg');

% im -- RGB image,
% top, bottom, left, right -- boundary of rectangular region (px)
% first average the RGB values at each pixel to produce a luminance image

% figure, imagesc, mean, std, double.

top1 = 500;
bottom1 = 900;
left1 = 500;
right1 = 800;

im2 = imread('7.jpeg');
top2 = 300;
bottom2 = 800;
left2 = 400;
right2 = 800;

% noise_light = noiseAnalCrop(im1, top1, bottom1, left1, right1);
noise_dark = noiseAnalCrop(im2, top2, bottom2, left2, right2);
% 
% noise_diff = noiseAnalDiff(im1, im2);

