clear all
clc
close all

addpath(genpath('pics/'));
img = imread('test.jpg');

im = rgb2gray(img);
im = im2double(im);
% figure;
% imshow(im);

s1 = 1.6;
ns = 3;
noctaves = 3; 

pyr = GSS(im, s1, ns, noctaves);
showPyr(pyr,ns);
DoGPyr = DoGSS(pyr);
showPyr(DoGPyr,ns);
% kp = SSExtrema(DoGPyr);