function [noise] = noiseAnalCrop(im, top, bottom, left, right)
    % im -- RGB image, 
    % top, bottom, left, right -- boundary of rectangular region (px)
    % first average the RGB values at each pixel to produce a luminance image
    
    im = imcrop(im, [left top right bottom]);
    im = im2double(im);

    imAve = mean(im, 3);
    
    subplot(1,2,1);
    imshow(im);
    title('Cropped image');
    
    subplot(1,2,2);
    imshow(imAve);
    title('Cropped luminance image');
    
    figure; 
    x = [left right];
    y = [top bottom];
    imagesc(x, y, imAve); colorbar;
    colormap default
    
    % Plot a histogram of the luminance values.
    figure;
    histogram(imAve,30);
    title('Luminance values');
    xlabel('RGB Luminance Value')
    ylabel('Count of Pixels')

    % report the standard deviation of this luminance image,
    % normalized (divided) by the mean luminance.
    meanv = mean2(imAve);
    stdv = std2(imAve);
    noise = stdv / meanv;
end

