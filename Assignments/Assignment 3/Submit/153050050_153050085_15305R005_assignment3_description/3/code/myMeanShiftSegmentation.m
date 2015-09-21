function [out, newMean, k] = myMeanShiftSegmentation( in, hs, hr, th )
% https://courses.csail.mit.edu/6.869/handouts/PAMIMeanshift.pdf


startTime = tic;

%% Initialization
if ndims(in)==3
    [inRow, inCol, inDepth] = size(in);
else
    [inRow, inCol] = size(in);
end
disp(size(in));
sigma = 0.01*inCol;
gaussianFilter = fspecial('gaussian', [inRow inCol], sigma);
smoothedImage = imfilter(in, gaussianFilter);
disp(size(smoothedImage));
if ndims(smoothedImage)==3
    subsampledSmoothedImage = smoothedImage(1:2:inRow, 1:2:inCol, :);
    [inRow, inCol, inDepth] = size(subsampledSmoothedImage);
    inPaddedImage = padarray(subsampledSmoothedImage, [inRow, inCol, 0]);
    [inRowPad, inColPad, inDepth] = size(inPaddedImage);
else
    subsampledSmoothedImage = smoothedImage(1:2:inRow, 1:2:inCol);
    [inRow, inCol] = size(subsampledSmoothedImage);
    inPaddedImage = padarray(subsampledSmoothedImage, [inRow, inCol]);
    [inRowPad, inColPad] = size(inPaddedImage);
end

out = subsampledSmoothedImage;
%figure; imshow(uint8(out)); axis image; title(sprintf('Smoothed Image'));
intensityMap = exp( -(0:255^2)/hr^2 ); % Intensity map for intensity kernel
disp(size(inPaddedImage));
%figure;
for k=1:20
    %fprintf(1, 'Iteration %d\n', k);
    sumTotalDenominator = 0;
    sumTotalNumerator = 0;
    for i=-hs:hs
        for j=-hs:hs
            spatialKernel = exp(-(i^2+j^2)/(hs/3)^2/2);
            %fprintf(1, '%d\t%d\t%d\t%d\n', inRow+i, 2*inRow+i-1, inCol+j, 2*inCol+j-1);
            inShift = inPaddedImage(inRow+i:2*inRow+i-1, inCol+j:2*inCol+j-1, 1:inDepth);
            inDiffSquare = (double(out)-double(inShift)).^2;
            intensityKernel = repmat( sum( reshape( intensityMap( inDiffSquare+1 ), inRow, inCol, inDepth), 3 ), [1,1, inDepth]);
            totalKernel = double(spatialKernel).*double(intensityKernel);
            numerator = double(inShift).*double(totalKernel);
            denominator = sum(sum(totalKernel));
            sumTotalDenominator = sumTotalDenominator + totalKernel;
            sumTotalNumerator = sumTotalNumerator + numerator;
        end            
    end
    outNew = sumTotalNumerator./sumTotalDenominator;
    newMean = mean(abs(round(double(outNew(:)))-round(double(subsampledSmoothedImage(:)))));
    out = round(outNew);
    %imshow(uint8(out)); axis image; title(sprintf('Iteration %d', k)); drawnow;
    if newMean<=th
        break;
    end
end


timeElapsed = toc(startTime);
fprintf(1, 'My myMeanShiftSegmentation takes %f seconds.\n', timeElapsed);

end