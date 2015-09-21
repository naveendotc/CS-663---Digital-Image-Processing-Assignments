%% MyMainScript

tic;
%% Your code here

%%  Problem 1
%   myUnsharpMasking

%in1 = imread('../../1/data/superMoonCrop.mat');
%in2 = imread('../../1/data/lionCrop.mat');

in1 = load('../../1/data/superMoonCrop.mat');
inp1 = in1.imageOrig;
in2 = load('../../1/data/lionCrop.mat');
inp2 = in2.imageOrig;

[out1] = myUnsharpMasking(inp1);
figure;
subplot(1,2,1); imagesc(inp1); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out1); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 



[out2] = myUnsharpMasking(inp2);
figure;
subplot(1,2,1); imagesc(inp2); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out2); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


toc;
%%%%%%%%%%% sigma = 32, s = 0.5 %%%%%%%%%%%%
%psnr(inp1,out1) = 15.8253
%psnr(inp2,out2) = 41.8354
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% sigma = 10, s = 0.7 %%%%%%%%%%%%%
%psnr(inp1,out1) = 14.5416
%psnr(inp2,out2) = 31.3333
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%% sigma = 25, s = 0.7 %%%%%%%%%%%%%
%psnr(inp1,out1) = 14.5358
%psnr(inp2,out2) = 31.2956
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%