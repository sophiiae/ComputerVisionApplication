clear all
clc
close all

addpath(genpath('pics/'));
indoor = imread('indoor.jpeg');
id = im2double(indoor);
outdoor = imread('outdoor2.jpg');
od = im2double(outdoor);

% imshow(indoor);
% [x, y] = getpts;

intop = 1000;
inbottom = 2000;
inleft = 640;
inright = 1600;

% wb = whiteBalance(id, intop, inbottom, inleft, inright);

outtop = 700;
outbottom = 1300;
outleft = 440;
outright = 1500;
wb = whiteBalance(od, outtop, outbottom, outleft, outright);





