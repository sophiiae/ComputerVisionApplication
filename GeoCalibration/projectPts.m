function [pts] = projectPts(objpts, K, R, t)
    % Project 3D object points on image

    z3 = zeros(3, 1);
    K = [K z3];

    z4 = zeros(1, 4);
    E = [R t; z4];

    z6 = ones(6, 1);
    objpts = [objpts z6];

    pts = E * objpts';
    pts = (K * pts)';

    pts = pts(:,1:2)./repmat(pts(:,3),1,2);
end

