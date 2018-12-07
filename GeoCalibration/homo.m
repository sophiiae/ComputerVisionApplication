function [ M ] = homo(objpts,imgpts)
% Generate homogeneous matrix A for decomposition

    A = ones(1, 4); 
    B = zeros(1, 4);

    k1 = [A B];
    k2 = [B A];

    M = zeros(12,12);
    t = 1;
    for i=1:6
        pt = imgpts(i,:);
        x = -A * pt(1);
        y = -A * pt(2);
        m1 = [k1 x];
        m2 = [k2 y];
        M(t:t+1, :) = [m1;m2];
        t = t + 2;
    end

    argpts = [objpts ones(6, 1)];
    C = zeros(12, 6);
    for i = 1: 6
        pt = argpts(i,:);
        t = pt';
        C(:,i) = [t; t; t];
    end

    s = 1
    for i = 1: 6
        r = M(s:s+1,:)
        c = C(:,i)
        M(s:s+1,:) = r .* c'
        s = s + 2
    end

end

