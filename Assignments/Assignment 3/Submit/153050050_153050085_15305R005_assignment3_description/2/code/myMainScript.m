%% myMainScript.m
tic;
in = load('../data/boat.mat');
inp = in.imageOrig;
%inp=inp./255;
figure,
imagesc(inp),colormap(gray),title('Input Image');axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([2 3 1]);
k=0.2;
sigma1=1;
sigma2=2;
[Ix, Iy, lamda1, lamda2,cornerness_measure ] = myHarrisCornerDetector(inp,sigma1,sigma2,k); %Ix and Iy are image derivatives
figure,
imagesc(Ix),colormap(gray),title('I_x');axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([2 3 1]);

figure,
imagesc(Iy),colormap(gray),title('I_y');axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([2 3 1]);

figure,
imagesc(lamda1),colormap(gray),title('\lambda_1'),axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([2 3 1]);

figure,
imagesc(lamda2),colormap(gray),title('\lambda_2');axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([2 3 1]);

figure,
imagesc(cornerness_measure),title('Corner-ness measure');axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([2 3 1]);

fprintf('sigma-1: %d\nsigma-2: %d \nk: %d\n',sigma1,sigma2,k);
toc;