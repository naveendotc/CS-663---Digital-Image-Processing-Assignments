%%  myMainScript

tic;
%%  Your code here

in1 = imread('../data/barbara.png');
in2 = imread('../data/TEM.png');
in3 = imread('../data/canyon.png');

%%  Problem 2a
%    myLinearContrastStretching

[out11] =  myLinearContrastStretching(in1);
[out12] =  myLinearContrastStretching(in2);
[out13] =  myLinearContrastStretching(in3);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out11); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out12); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out13); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 2b
%   myHE

%imshow(in2);
[out21] = myHE(in1);
[out22] = myHE(in2);
[out23] = myHE(in3);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out21); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out22); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out23); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 2c
%   myAHE

[out31] = myAHE(in1, 45);
[out32] = myAHE(in2, 45);
[out33] = myAHE(in3, 45);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out31); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out32); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out33); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 2d
%   myCLAHE

[out41] = myCLAHE(in1, 11, 0.9);
[out42] = myCLAHE(in2, 11, 0.9);
[out43] = myCLAHE(in3, 11, 0.9);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out41); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out42); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out43); colormap(gray); axis tight; impixelinfo; colorbar('southoutside'); daspect ([1 1 1]); 


toc;
