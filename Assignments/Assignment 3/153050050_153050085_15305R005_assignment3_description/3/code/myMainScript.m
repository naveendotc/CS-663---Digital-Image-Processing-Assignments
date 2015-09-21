%% MyMainScript

close all;clc; clear all;
tic;
%% Your code here
in = imread('../data/baboonColor.png');
inp = in;

figure; imagesc(inp); title('Input Image'); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);

hs = 20; hr = 32; th = 0.25; 
[out, newMean, noOfIterations] = myMeanShiftSegmentation( inp, hs, hr, th );
out = uint8(out);
figure; imagesc(out); title('Output Image'); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
fprintf(1, 'Optimal Parameters used\n');
fprintf(1, 'hs = %.f\n', hs);
fprintf(1, 'hr = %.f\n', hr);
fprintf(1, 'Number of Iterations = %d\n', noOfIterations);
toc;
