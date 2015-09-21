%% myUnsharpMasking

function [out] = myUnsharpMasking(in)

startTime = tic;
%tic;

[row, col] = size(in);

hSizeRow = 3; hSizeCol = 3; sigma = 25; s = 0.7;
gaussianFilter = fspecial('gaussian', [hSizeRow hSizeCol], sigma);
blurredImage = imfilter(in, gaussianFilter);
negativeBlurredImage = 255 - blurredImage;
subNegBlurredImage = in + negativeBlurredImage;
unsharpMaskImage = in + s*subNegBlurredImage;
unsharpMaskImage = mat2gray(unsharpMaskImage);
out = unsharpMaskImage;

%toc;
timeElapsed = toc(startTime);
fprintf(1, 'My myUnsharpMasking takes %f seconds.\n', timeElapsed);

end
