function [Rp] = iteration(K, R, t, x, X, im)
    ran = randi([1 6], 6, 1);
    uni = unique(ran);
    
    % ensure it has at least 3 unique numbers
    while(size(uni,1) < 3)
        ran = randi([1 6], 6, 1);
        uni = unique(ran);
    end

    for i = 1: 6
        idx = ran(i,1);
        objpts(i,:) = X(idx,:);
        imgpts(i,:) = x(idx,:);
    end
    
    [Rp, tp] = pose(K, R, t, imgpts, objpts, im);
end
