function [DoGPyr] = DoGSS(GPyr)
% GPyr -- a Gaussian pyramid
% DoGPyr -- cell array of length noctaves containing the Difference of
% Gaussian pyramid
    
    noctaves = length(GPyr);
    DoGPyr = cell(noctaves, 1);
    
    for oc = 1: noctaves
        stack = GPyr{oc};
        [h, w, n] = size(stack);
        diff = zeros(h, w, n-1);
        for sub = 1: n-1
            diff(:,:,sub) = stack(:,:,sub+1) - stack(:,:,sub);
        end
        DoGPyr(oc) = {diff};
    end
end

