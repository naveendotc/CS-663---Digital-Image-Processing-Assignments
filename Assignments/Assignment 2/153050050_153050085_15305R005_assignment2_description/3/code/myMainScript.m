%% MyMainScript

tic;
%% Your code here

%%  Problem 1
%   myPatchBasedFiltering

%in1 = imread('../../3/data/barbara.mat');

in1 = load('../../2/data/barbara.mat');
inp1 = in1.imageOrig;
[inpRow inpCol]=size(inp1);
[in,out1] = myPatchBasedFiltering(inp1);
figure;
subplot(1,3,1); imagesc(inp1(1:2:inpRow, 1:2:inpCol)); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,3,2); imagesc(in); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 
subplot(1,3,3); imagesc(out1); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  RMSD      Time taken  value of 'h' 
%------------------------------------
%12.167064 - 23.25 min -  100000   optimal
%14.684347 - 25.1 min  -  1000
%14.778898 - 22.5 min  -  100
%30.239807 - 25.5 min  -  10

toc;
