function [R, t, K] = calculateParam(P)
% Use RQ decomposition to get projection matrix

    A = P(:, 1:3);
    [Q, R] = qr(flipud(A)');
    Q = flipud(Q');
    R = flipud(fliplr(R' ));

    % ensure |K| and |A| are positive
    D = sign(diag(diag(R)));
    Q = inv(D) * Q; 
    R = D * R; 
    K = R; 
    R = Q;

    t = K \ P(:,4);
    K = K / K(end);
end

