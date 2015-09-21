% in  - Input Image
% out - Output Image

function [out] = myNearestNeighborInterpolation(in)

[row, col] = size(in);

nrow = 3*row-2;    % nrow - No. of rows in new image
ncol = 2*col-1;    % ncol - No. of cols in new image

sr = (row-1)/nrow; % sr - Scale ratio along row
sc = (col-1)/ncol; % sc - SCale ratio along col

for i = 1:1:nrow
    x = i*sr;
    mapi = round(x);
    
    if mapi == 0
        mapi = 1;
    end
    
    for j = 1:1:ncol
        y = j*sc;
        mapj = round(y);
        if mapj == 0
            mapj = 1;
        end
        out(i,j) = in(mapi,mapj);
    end

end


end