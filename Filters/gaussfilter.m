function [out, MSE] = gaussfilter(im, noisy, sigma)
    [h, w] = size(noisy);
    
    cx = floor(h / 2) + 1;
    cy = floor(w / 2) + 1;
    [X, Y] = meshgrid(1:w,1:h);
    x = X - cy;
    y = Y - cx;
    r = x .^ 2 + y .^2;
    
    k = exp(-(r ./ (2 ^ sigma)) .^2);
    gauss = 1 / (2 * pi * (sigma ^ 2)) * k; 
    
    maxg = max(gauss(:));
    idx = find(abs(gauss) < maxg * 0.001);
    gauss(idx) = 0;
    
    s = sum(gauss(:));
    gauss = gauss ./ s;
    
    tic
    out = conv2(noisy, gauss, 'same');
    elapsedTime = toc;
    
    MSE = immse(out, im);
    
    str = sprintf('%0.2f', sigma);
    
    figure;imshow(out, 'InitialMagnification','fit'); 
    title(['Filtered Image in Gaussian with sigma = ', str]);
end

