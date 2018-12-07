function [Rp, tp] = pose(K, R, t, x, X, im)
    p = [R, t];
    fun = @(p) projerr(p, K, x, X);
    options = optimoptions('lsqnonlin', 'Algorithm', 'levenberg-marquardt','Display', 'iter');
    p = lsqnonlin(fun, p, [], [], options);

    Rp = p(:,1:3);
    tp = p(:,4);
    
    show = 0;
    if show
        showRotDiff(R, Rp);
        figure; imagesc(im);
        axis image; axis off; hold on;
        title("Image with Optimized Rotation Matrix and Tranlation Vector");
        h1 = plot(x(:,1),x(:,2),'g*', 'MarkerSize', 15, 'LineWidth', 2);
        P = K * [Rp, tp];
        n = size(X, 1);
        X = [X, ones(n,1)];
        pts = (P * X')';
        pts = pts(:,1:2) ./ repmat(pts(:,3), 1, 2);
        h2 = plot(pts(:,1), pts(:,2), 'ro', 'MarkerSize', 15, 'LineWidth', 2,'MarkerEdgeColor','yellow');
    end
end

