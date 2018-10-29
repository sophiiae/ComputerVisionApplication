function [ out, H, MSE ] = freqdomain( im, noisy, b )
    
    [h, w] = size(noisy);
    [wx, wy] = freqspace([h w],'meshgrid');

%     cx = ceil(h / 2);
%     cy = ceil(w / 2) + 1;
%     [X, Y] = meshgrid(1:w,1:h);
%     wx = X - cy;
%     wy = Y - cx; 
%     wx = wx ./ max(wx(:));
%     wy = wy ./ max(wy(:));

    k = 1 + (((wx .^ 2) + (wy .^ 2)) .* (pi ^ 2)) ./ (b ^2);
    H = 1 ./ k;     % H(wx, wy)
    
    tic 
    ft = fftshift(fft2(noisy));
    out = ifft2(ifftshift(ft .* H));
    elapsedTime = toc;
    
    MSE = immse(out, im);
    
    %% plot figures;

    str = sprintf('%0.2f',b);
    figure; imshow(H,[],'InitialMagnification','fit');
    title(['Frequency Domain Filter H with b = ', str]);
    
    figure; imagesc([1 h],[1 w],H); 
    colorbar; colormap default;
    title(['Freqency Domain Filter H with b = ', str]);
    
    c = ceil(h/2);
    figure; plot(H(c, :));
    title(['1D Cross-section of Frequency Filter H with b = ',str]);
    xlabel('Position');
    ylabel('Value');
    
    figure;imshow(out, 'InitialMagnification','fit'); 
    title(['Filtered Image in Frequency Domain with b = ', str]);

end

