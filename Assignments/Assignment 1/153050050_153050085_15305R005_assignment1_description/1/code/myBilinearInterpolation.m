% in  - Input Image
% out - Output Image

function [out] = myBilinearInterpolation(in)

[row, col] = size(in);
nrow = 3*row-2;    % nrow - No. of rows in new image
ncol = 2*col-1;    % ncol - No. of cols in new image

sr = (row-1)/nrow; % sr - Scale ratio along row
sc = (col-1)/ncol; % sc - SCale ratio along col

for i = 1:nrow
    x  = i*sr;
    x1 = floor(x); % For X coordinate of Left Pixel
    x2 = ceil(x);  % For Y coordinate of Right Pixel
    
    if x1 == 0
        x1 = 1;    % Because index 0 doesnot exist in matlab
    end
    
    dx = rem(x,1); % Finding delta x
    
    for j = 1:ncol
        y=j*sc;
        y1 = floor(y);
        y2 = ceil(y);
        
        if y1 == 0
            y1 = 1;  % Because index 0 doesnot exist in matlab
        end
        dy = rem(y,1); % Finding delta y
        
        % Formula
        % out = in(r,c)*(1-dr)*(1-dc) + in(r+1,c)*(dr)*(1-dc) + in(r,c+1)*(1-dr)*(dc) + in(r+1,c+1)*(dr)*(dc)
        BottomLeft  = in(x1,y1,:);  % Calculating pixels of various corners
        TopLeft     = in(x1,y2,:);
        BottomRight = in(x2,y1,:);
        TopRight    = in(x2,y2,:);
        
        R1 = BottomRight*dy + BottomLeft*(1-dy);
        R2 = TopRight*dy + TopLeft*(1-dy);
        
        out(i,j) = R1*dx + R2*(1-dx); % Output image
    end
end



end