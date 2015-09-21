%%  myMainScript

tic;
%%  Your code here

%%  Problem 1a
%   myShrinkImageByFactorD

in1 = imread('../../1/data/circles_concentric.png');
%imshow(in1); figure;
[out1] = myShrinkImageByFactorD(in1, 2);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
[out2] = myShrinkImageByFactorD(in1, 3);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 1b
%   myBilinearInterpolation

in2 = imread('../../1/data/barbaraSmall.png');
%imshow(in2);
[out3] = myBilinearInterpolation(in2);
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out3); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 1c
%   myNearestNeighborInterpolation

[out4] = myNearestNeighborInterpolation(in2);
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out4); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);

toc;
