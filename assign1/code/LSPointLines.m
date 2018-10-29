function [x] = LSPointLines(L)
    % L = [l1 l2 l3 ...] containing n lines in homogeneous format.
    % returns the point x (Euclidean) minimizing the sum of squared
    % distances to each line.
    [r,n] = size(L);
    
    %=======function start here ========================
    
    % L (3 x n matrix);
    dn = L(3,:);        %ci
    un = sqrt(sum(L(1:2,:) .^ 2));  %sqrt(ai^2 + bi^2)
    di = abs(dn ./ un);

    ni = L(1:2,:);

    for k = 1: n
        if L(3,k) > 0
            ni(:,k) = ni(:,k) * -1;
        end
    end

    A = ni * ni';      % 2 x 2 matrix
    part1 = inv(A);       % A inverse

    M = zeros(2,n);
    for k = 1:n
        M(:,k) = di(1,k) * ni(:,k);
    end
    
    part2 = sum(M,2);
    % sum of d and normal (2 x 1)
    x = part1 * part2;

end

