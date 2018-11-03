function [ out, h, MSE ] = spacedomain( im, b, H )
    
    h = ifft2(ifftshift(H)); % h - spatial filter, H - freq filter
    h = abs(fftshift(h));

    maxh = max(h(:));
    idx = find(abs(h) < maxh * 0.001);
    h(idx) = 0;
    
    h = h ./ sum(h(:));
    [kx, ky] = size(h);
    
    tic
    out = conv2(im, h, 'same');
    elapsedTime = toc;

    MSE = immse(out, im);
    
    %% Plot figures;
    
    str = sprintf('%0.2f',b);
    figure;
    imshow(h,[], 'InitialMagnification','fit');
    title(['Space Domain Filter h with b = ', str]);
    
    figure; 
    imagesc([1 kx], [1 ky],h); 
    colorbar; colormap default;
    title(['Space Domain Filter h with b = ', str]);
    
    mid = h(ceil(kx/2), :);
    figure; plot(mid);
    title(['1D Cross-section of Spatial Filter h with b =', str]);
    xlabel('Position');
    ylabel('Value');

    figure; imshow(out,'InitialMagnification','fit');
    title(['Filtered Image in Space Domain with b = ',str]);
end

