function [noise] = noiseAnalDiff(im1, im2)
    % two successive RGB images im1 and im2
    % returns an esti mate of the normalized sensor noise
    %first average the RGB values at each pixel before differencing the two images
    im1 = im2double(im1);
    im2 = im2double(im2);
    
    ave1 = mean(im1, 3);
    ave2 = mean(im2, 3);
        
    diff = ave1 - ave2;

    %Show the luminance difference image
    figure;imshow(diff,[]);
    figure;imagesc(diff);

    %Plot a histogram of the luminance difference values.
    figure;
    histogram(diff,30); title('Luminance Difference Value');
    xlabel('RGB Luminance Value')
    ylabel('Count of Pixels')

    std_diff = std2(diff);
    mean_diff = mean2(diff);
    noise = std_diff / mean_diff;
end

