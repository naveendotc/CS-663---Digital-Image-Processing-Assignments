%% myBilateralFiltering

function [noisyImage, out] = myBilateralFiltering(in)

startTime = tic;
[row, col] = size(in);

% Adding gaussian noise to image
% J = rgb2gray(I);
meanIn = 0;
varianceIn = 0.05*(max(max(in))-min(min(in)));
in = im2double(in);
noisyImage = in + sqrt(varianceIn)*randn(row, col) + meanIn;


w = 5; sigmaI = 10000000000; sigmaD = 10000000000; 
w = floor(w/2);
%sigmaI =  0.05*(max(max(in))-min(min(in)));
%sigmaD = 0.05*(max(row,col));
% Pre-compute Gaussian distance weights.
[gaussianDX, gaussianDY] = meshgrid(-w:w,-w:w);
%[gaussianDX, gaussianDY] = meshgrid(floor(-w/2):floor(w/2),floor(-w/2):floor(w/2));
gaussianD = exp(-(gaussianDX.^2+gaussianDY.^2)/(2*sigmaD^2));

% Apply bilateral filter.
[row1, col1] = size(noisyImage);
filteredImage = zeros(row1, col1);
for i = 1:row1
   for j = 1:col1

         % Extract local region.
         iMin = max(i-w,1);
         iMax = min(i+w,row);
         jMin = max(j-w,1);
         jMax = min(j+w,col);
         window = noisyImage(iMin:iMax,jMin:jMax);
      
         % Compute Gaussian intensity weights.
         dummyWindow = (-1.*(window-noisyImage(i,j)));
         %disp(size(dummyWindow));
         %disp(dummyWindow);
         gaussianI = exp(dummyWindow.^2/(2*sigmaI*sigmaI));
      
         % Calculate bilateral filter response.
         filtered = gaussianI.*gaussianD((iMin:iMax)-i+w+1,(jMin:jMax)-j+w+1);
         filteredImage(i,j) = sum(filtered(:).*window(:))/sum(filtered(:));
               
   end
end

out = filteredImage;

timeElapsed = toc(startTime);
i = 1; rmsdOutNoisy = rootMeanSquaredDifference(noisyImage, out);
fprintf(1, 'RMSD = %f\n', rmsdOutNoisy);
fprintf(1, 'My Bilateral Filtering takes %f seconds\n', timeElapsed);

	%%

	function [rmsd] = rootMeanSquaredDifference(A, B)

		[row2, col2] = size(A);
		difference = (A-B).^2;
		rmsd = sum(sum(difference));
		rmsd = rmsd/(row2*col2);
		rmsd = sqrt(rmsd);

	end


end
