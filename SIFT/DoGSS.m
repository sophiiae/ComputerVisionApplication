function [DoGPyr] = DoGSS(GPyr)
% GPyr -- a Gaussian pyramid
% DoGPyr -- cell array of length noctaves containing the Difference of
% Gaussian pyramid
    
    noctaves = length(GPyr);
    DoGPyr = cell(noctaves, 1);
    
    for oc = 1: noctaves
        stack = GPyr{oc};
        [h, w, n] = size(stack);
        DoG = zeros(h, w, n-1);
        DoG(:,:,:) = diff(stack, 1, 3);
        DoGPyr(oc) = {DoG};
    end
end

