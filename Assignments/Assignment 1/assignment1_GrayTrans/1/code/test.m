row = 103;
col = 103;
fprintf(1, '%d, %d\n', row, col);
nrow = 3*row-2;
ncol = 2*col-1;

sr = (row-1)/nrow;
sc = (col-1)/ncol;

rf = [1:nrow]*sr;
cf = [1:ncol]*sc;

r = floor(rf);
c = floor(cf);

dr = rf - r;
dc = cf - c;

ind1 = sub2ind([row, col], r, c);
ind2 = sub2ind([row, col], r+1,c);
ind3 = sub2ind([row, col], r, c+1);
ind4 = sub2ind([row, col], r+1, c+1); 

out = in(ind1).*(1 - dr).*(1 - dc) + in(ind2).*(dr).*(1 - dc) + ...
      in(ind3).*(1 - dr).*(dc) + in(ind4).*(dr).*(dc);

%% Debugging

disp(size(out));
disp(size(sr));
disp(size(sc));
disp(size(rf));
disp(size(cf));
disp(size(r));
disp(size(c));
disp(size(dr));
disp(size(dc));
