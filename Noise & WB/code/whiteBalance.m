function [wb] = whiteBalance(im,top, bottom, left, right)
    % WHITEBALANCE Summary of this function goes here
    % Detailed explanation goes here
    im = imcrop(im, [left top right bottom]);
    im = im2double(im);
    figure; imagesc(im); colorbar;
    
    r = im(:,:,1);
    g = im(:,:,2);
    b = im(:,:,3);

    rAve = mean2(r);
    gAve = mean2(g);
    bAve = mean2(b);

    aveGray = (rAve + gAve + bAve) / 3;

    rc = aveGray / rAve;
    gc = aveGray / gAve;
    bc = aveGray / bAve; 

    wb(:,:,1) = rc * r;
    wb(:,:,2) = gc * g;
    wb(:,:,3) = bc * b;
    %% Plot the original image and white balanced image
    
    figure;
    subplot(1,2,1);
    imshow(im);
    title('Before white balancing');
    
    subplot(1,2,2);
    imshow(wb);
    title('After white balancing');
    
    figure; imagesc(wb); colorbar;
    

end

