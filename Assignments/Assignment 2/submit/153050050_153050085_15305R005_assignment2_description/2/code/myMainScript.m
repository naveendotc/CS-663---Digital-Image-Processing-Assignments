%% MyMainScript

tic;
%% Your code here

%%  Problem 1
%   myBilateralFiltering

%in1 = imread('../../2/data/barbara.mat');
clear all 
close all

in1 = load('../../2/data/barbara.mat');
inp1 = in1.imageOrig;


[noise, out1] = myBilateralFiltering(inp1);
figure;
subplot(1,3,1); imagesc(inp1); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,3,2); imagesc(noise); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,3,3); imagesc(out1); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


toc;

%sigmaI = 1000000000; sigmaD = 100000000; RMSD-7.687153 
%sigmaI = 100; sigmaD = 10; RMSD-7.851597
%sigmaI = 10000; sigmaD = 10000; RMSD-7.686662
%sigmaI = 10000000000; sigmaD = 10000000000; RMSD-7.680380  optimal
%sigmaI = 10000000000; sigmaD = 100000000000; RMSD-7.681746

%sigmaD=0.9*sigmaD(optimal)  RMSD-7.690680
%sigmaD=1.1*sigmaD(optimal)  RMSD-7.691091
%sigmaI=0.9*sigmaI(optimal)  RMSD-7.686094
%sigmaI=0.9*sigmaI(optimal)  RMSD-7.687228







