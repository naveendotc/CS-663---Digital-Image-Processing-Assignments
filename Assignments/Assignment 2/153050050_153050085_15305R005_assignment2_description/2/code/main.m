%% MyMainScript

tic;
%% Your code here

%%  Problem 1
%   myBilateralFiltering

%in1 = imread('../../2/data/barbara.mat');

in1 = load('../../2/data/barbara.mat');
inp1 = in1.imageOrig;
%inp1=[5 6 8 3;4 23 54 77;12 43 76 90;33 94 23 85];

[noise, out1] = bil(inp1);
inp1=double(inp1);
figure;
subplot(1,3,1); imagesc(inp1); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,3,2); imagesc(noise); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,3,3); imagesc(out1); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


toc;
