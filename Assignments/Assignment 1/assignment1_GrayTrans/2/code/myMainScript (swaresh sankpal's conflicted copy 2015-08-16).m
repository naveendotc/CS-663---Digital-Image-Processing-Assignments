%%  myMainScript

tic;
%%  Your code here

in1 = imread('../../2/data/barbara.png');
in2 = imread('../../2/data/TEM.png');
in3 = imread('../../2/data/canyon.png');

%%  Problem 2a
%    myLinearContrastStretching

[out11] =  myLinearContrastStretching(in1);
[out12] =  myLinearContrastStretching(in2);
[out13] =  myLinearContrastStretching(in3);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out11); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out12); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out13); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 2b
%   myHE

%imshow(in2);
[out21] = myHE(in1);
[out22] = myHE(in2);
[out23] = myHE(in3);
figure;
subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out21); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out22); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
figure;
subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out23); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 2c
%   myAHE

% [out31] = myAHE(in1);
% [out32] = myAHE(in2);
% [out33] = myAHE(in3);
% figure;
% subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(1,2,2); imagesc(out21); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
% figure;
% subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(1,2,2); imagesc(out22); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
% figure;
% subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(1,2,2); imagesc(out23); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%  Problem 2d
%   myCLAHE

% [out41] = myCLAHE(in1);
% [out42] = myCLAHE(in2);
% [out43] = myCLAHE(in3);
% figure;
% subplot(1,2,1); imagesc(in1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(1,2,2); imagesc(out21); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
% figure;
% subplot(1,2,1); imagesc(in2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(1,2,2); imagesc(out22); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
% figure;
% subplot(1,2,1); imagesc(in3); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(1,2,2); imagesc(out23); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 


toc;



%%% Dummy

% figure;
% subplot(3,2,1); imagesc(in1); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(3,2,2); imagesc(out31); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
% subplot(3,2,3); imagesc(in2); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(3,2,4); imagesc(out32); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 
% subplot(3,2,5); imagesc(in3); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]);
% subplot(3,2,6); imagesc(out33); colormap(gray); axis tight; colorbar('southoutside'); daspect ([1 1 1]); 