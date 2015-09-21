% AHE
%
%  Takes an Image j and does adaptive histogram equalization
%  on the image with the given windowsize and n bins.
%
%  Bradley C. Grimm 
%  CS 6640 - Image Processing
%  October 1, 2009

function [ out ] = AHE_2(I, n, windowsize)

if ( nargin < 3 )
    windowsize = size(I,1) * 0.1;
end

r = floor((windowsize-1)/2);
minI = min(min(I));
maxI = max(max(I));
minI=0;
maxI=15;
step = (maxI - minI) / (n - 1);
step = 1;
H = zeros(n,1);

[row, col] = size(I);
out = zeros(row, col);
area = 0;

for i=1:row
    % Find row of addition/subtraction boxes.
    lowi = max(1, i - r);
    highi = min(row, i + r);
    
    % Iterate over col.  Extra padding dependent on window size.
    for j=(-r+1):(col+r+1)
        % Find the line that is no longer part of our window.
        subj = j - r - 1;

        % Add new line to window.
        addj = j + r;
        fprintf(1,'Calculating %d,%d ; %d,%d ; %d,%d\n',i,j,lowi,highi,subj,addj);
        % Remove pixels on the left edge.
        if ( subj >= 1 )
            % Create histogram, don't scale.
            for jj = lowi:highi
                idx = floor(I(jj, subj) / step) + 1;
                fprintf(1,'%d %d\n',idx);
                H(idx) = H(idx) - 1;
            end
            % Modify histogram size (for later scaling).
            area = area - (highi - lowi + 1);
        end
        
        % Add pixels on the right edge.
        if ( addj <= col )
            % Create histogram, don't scale.
            for jj = lowi:highi
                idx = floor(I(jj, addj) / step) + 1;
                fprintf(1,'%d %d\n',idx,I(jj, addj));
                H(idx) = H(idx) + 1;
            end
            % Modify histogram size (for later scaling).
            area = area + (highi - lowi + 1);
        end
        
        if ( j >= 1 && j <= col )
            % Update pixel value.
            
            idx = floor(I(i, j) / step) + 1;
            val = 0;
            disp(H');
            fprintf(1,'\nOut pixel : (%d,%d) idx=%d ',i,j,idx);
            % Determine CDF value on the fly from PDF.
            for k=1:(idx-1)
                val = val + H(k);
            end
            fprintf(1,'val=%d area=%d\n',val,area);
            % Convert to true CDF value.
            val = (val / area) * (n - 1);
            
            out(i, j) = val;
        end
    end
    
end

% Scale to viewable range.
out = out / n;

end
