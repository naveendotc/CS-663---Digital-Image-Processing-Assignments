% histogram
%
%  Takes an Image I and creates a histogram with n bins
%  along the range of g_min to g_max (inclusive).
%  A great way to visiualize this is with matlab's bar function.
%
%  Bradley C. Grimm 
%  CS 6640 - Image Processing
%  Sept 9, 2009

function [ output ] = histogram( I, n, g_min, g_max )

% Setup.
output = zeros(n,1);
range = (g_max - g_min) / (n - 1);

[width height] = size(I);

% Iterate over entire image.
for i=1:width
    for j=1:height
        v = I(i, j);
        % If it's out of range, throw it away.
        if ( v < g_min || v > g_max )
            continue;
        end
        
        % Store it in its appropriate bin.
        new_val = floor(double((v - g_min)) / range) + 1;
        output(new_val) = output(new_val) + 1;
    end
end

%output = output';
% Scale outputs to 0.0 - 1.0 range.
output = output / (width * height);