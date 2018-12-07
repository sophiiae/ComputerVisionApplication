function [err] = projerr(p, K, x, X)
% estimate the err between generated points and given points
   X = aug(X); 
   est = K * p * X'; 
   est = est';
   est = est(:,1:2) ./ repmat(est(:,3), 1, 2);
   err = est - x;
end

function [pts] = aug(p)
    % convert p to argumented matrix
    n = size(p, 1);
    pts = [p ones(n,1)];
end