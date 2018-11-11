function [GPyr] = GSS(im , s1, ns, noctaves)
% im -- grayscale image, 
% s1 -- space constant of the Gaussian kernel, s1 = 1.6
% ns -- number of scale space interval, ns = 3
% noctaves -- number of octaves
% GPyr -- cell(octave) array containing the Gaussian pyramid, 
% each octave contains ns+3 images.  
% This allows computations of ns+2 DoG images.
    
    n = ns + 3;  % number of suboctave images
    k = 2 ^ (1 / ns); % scale factor
    GPyr = cell(noctaves, 1);
    base = im;
    %% Loop 
    for oc = 1: noctaves
        [h, w] = size(base);
        stack = zeros(h, w, n);
        % for each sub-octaves
        for sub = 1: n
            sigma = s1;
            if (sub > 1)
                sigma = sigma * sqrt(k ^ 2 - 1);
            end
            base = gauss(base, sigma);
            expand = padding(h, w, base);
            stack(:,:,sub) = expand;
        end
        GPyr(oc) = {stack};
        base = imresize(stack(:,:,ns-1), 0.5, 'nearest');
    end

end

%% Apply Gaussian filter to the image
function [blur] = gauss(im, sigma)
    rmax = ceil(sqrt(2*sigma^2*log(100))); %truncate at 0.1%
    x = [-rmax:rmax];
    h = exp(-x.^2/(2*sigma^2));
    h = h/sum(h(:)); %normalize to unit volume
    blur = conv2(h, h, im, 'valid');
end
 
%% Add Padding to the extend the image to maintain the constant image size
function [expand] = padding(h, w, blur)
    expand = NaN(h,w);
    [bh, bw] = size(blur);
    padh = (h - bh) / 2;
    padw = (w - bw) / 2;
    expand(padh+1:padh+bh, padw+1:padw+bw) = blur;
end

