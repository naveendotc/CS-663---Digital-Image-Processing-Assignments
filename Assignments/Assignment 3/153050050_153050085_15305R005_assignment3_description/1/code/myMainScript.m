%% MyMainScript

tic;
%% Your code here
clear all
close all

in1 = load('../data/boat.mat');
inp1 = in1.imageOrig;
[noisy out]=myButterworthFiltering(inp1, 150);
figure;
subplot(1,3,1);imagesc(inp1);title('Input Image');colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,3,2);imagesc(noisy);title('Corrupted Image');colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,3,3);imagesc(out);title('Filtered Image');colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);

toc;

%optimal RMSD = 5.7786  D0 = 150 
%if D0=0.95*D0  i.e D0=142.5  RMSD=6.0379
%if D0=1.05*D0  i.e D0=157.5  RMSD=5.5343

%energy for D0=150
%Radius=2  Percentage=90.5730(~91%) RMSD=5.7801
%Radius=5  Percentage=94.1337(~94%) RMSD=5.7755
%Radius=20  Percentage=97.4625(~97%) RMSD=5.7702
%Radius=70  Percentage=99.0671(~99%) RMSD=5.7759




