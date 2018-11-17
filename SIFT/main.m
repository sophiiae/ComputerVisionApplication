clear all
clc
close all

addpath(genpath('pics/'));
img = imread('test.jpg');

im = rgb2gray(img);
im = im2double(im);
figure;
imshow(im);

s1 = 1.6;
ns = 3;
noctaves = 3; 

% constuct Gaussian pyramid and plot the pyramid
pyr = GSS(im, s1, ns, noctaves);
showPyr(pyr,ns);

% construct DoG pyramid and plot DoG
DoGPyr = DoGSS(pyr);
showPyr(DoGPyr,ns);

% find keypoints
kp = SSExtrema(DoGPyr);
nkp = 10;
showKP(DoGPyr, ns, kp, nkp);