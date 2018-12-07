clear all
clc
close all

addpath(genpath('images/'));
im = imread('LSB.jpg');

objpts = [0 78.4034 18.8290; 0 78.4034 0; 
          0    0    18.8290; 0    0    0;
          40.1091 0 18.8290; 40.1091 0 0;];

imgpts = [771.5 1891.5; 615.5 2635.5;
          2891.5 377.5; 2887.5 2743.5;
          4619.5 1551.5; 4859.5 2855.5];

% compute homogeneous system matrix 
H = homo(objpts, imgpts);

% decompose homogeneous system matrix to get initial guess 
% for camera matrix
[U, S, V] = svd(H);
v12 = V(:,12);
P = reshape(v12, 4, 3)';
P = sign(det(P(:,1:3))) * P;
[R, t, K] = calculateParam(P);

% project 3D world points to image coordinate
[pts] = projectPts(objpts, K, R, t);

pp = [2459, 1629.6];
px_size = 0.0047827;
fl = 15.688 / px_size;

% given intrinsic matrix 
K = [fl 0 pp(1); 
     0 fl pp(2); 
     0  0   1 ];

% optimize rotation matrix and translation vector with 
% given K and initial guess
[Rp, tp] = pose(K, R, t, imgpts, objpts, im);
r = rotm2axang(Rp);
theta = r(4);
theta = (180/pi)*theta; % convert angle to degree

% figure; imshow(im);
% hold on
% plot(pts(:,1), pts(:,2), 'g*-');
% hold off

% showRot(Rp);

%% Question 3.
n = 20; % number of iteration

for j = 1: n
    Rp2 = iteration(K, R, t, imgpts, objpts, im);
%     showRotDiff(Rp, Rp2);
    relR = Rp * inv(Rp2);
    r = rotm2axang(relR);
    theta = r(4);
    ang = (180/pi)*theta; % convert angle to degree
    rotAngles(j,:) = r;
    rel(j,1) = ang;
end

rms = rms(rel);




