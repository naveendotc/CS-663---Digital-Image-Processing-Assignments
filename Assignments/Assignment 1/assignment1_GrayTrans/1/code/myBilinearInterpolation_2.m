% in  - Input Image
% out - Output Image

function [out] = myBilinearInterpolation(in)

[row, col] = size(in);
fprintf(1, '%d, %d\n', row, col);
% Initial Assignment
nrow = 3*row-2;
ncol = 2*col-1;
%out = zeros(nrow, ncol);

% New Image Dimensions 
% Rows	  = 3*row - 2 = nrow
% Columns = 2*col - 1 = ncol
sr = (row-1)/nrow;
sc = (col-1)/ncol;

[cf, rf] = meshgrid(1 : ncol, 1 : nrow);

rf = rf*sr;
cf = cf*sc;

r = floor(rf);
c = floor(cf);

r(r < 1) = 1;
c(c < 1) = 1;
r(r > row - 1) = row - 1;
c(c > col - 1) = col - 1;
    
dr = rf - r;
dc = cf - c;

ind1 = sub2ind([row, col], r, c);
ind2 = sub2ind([row, col], r+1,c);
ind3 = sub2ind([row, col], r, c+1);
ind4 = sub2ind([row, col], r+1, c+1); 

out = zeros(nrow, ncol, size(in, 3));
out = cast(out, class(in));

in_new = double(in);
    
tmp = in_new(ind1).*(1 - dr).*(1 - dc) + in_new(ind2).*(dr).*(1 - dc) + ...
      in_new(ind3).*(1 - dr).*(dc) + in_new(ind4).*(dr).*(dc);

out = cast(tmp, class(in));

%% Debugging

% disp(size(out));
% disp(size(sr));
% disp(size(sc));
% disp(size(rf));
% disp(size(cf));
% disp(size(r));
% disp(size(c));
% disp(size(dr));
% disp(size(dc));

end

