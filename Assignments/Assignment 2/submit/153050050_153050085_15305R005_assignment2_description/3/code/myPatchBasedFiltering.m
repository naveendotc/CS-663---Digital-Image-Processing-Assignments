%% myPatchBasedFiltering

function [in,out] = myPatchBasedFiltering(inp1)

startTime = tic;
%tic;
%in1 = load('../../3/data/barbara.mat');
%inp1 = in1.imageOrig;

[inpRow inpCol] = size(inp1);


% Gaussian Blur Image
G = fspecial('gaussian', [5 5], 0.66*(inpCol));
noisyImage = imfilter(inp1, G, 'same');
in = noisyImage(1:2:inpRow, 1:2:inpCol);


[inRow inCol] = size(in);

out = single(zeros(inRow, inCol));

patchSize = 4; % Actual Patch Size = 2*patchSize+1
windowSize = 12; % Actual Window Size = 2*windowSize+1
padImage = padarray(in, [patchSize patchSize]);


h = 100000;
fprintf(1, 'Start\n' );
for i = 1:inRow
    i
    for j = 1:inCol

        i1 = i + patchSize;
        j1 = j + patchSize;
            
        fixedPatch = padImage(i1-patchSize:i1+patchSize , j1-patchSize:j1+patchSize);
        fixedPatchJMin = j1-patchSize;
        fixedPatchJMax = j1+patchSize;
        fixedPatchIMin = i1-patchSize;
        fixedPatchIMax = i1+patchSize;

        windowIMin = max(i1-windowSize,patchSize+1);
        windowIMax = min(i1+windowSize,inRow+patchSize);
        windowJMin = max(j1-windowSize,patchSize+1);
        windowJMax = min(j1+windowSize,inCol+patchSize);
        
        window = padImage(windowIMin:windowIMax, windowJMin:windowJMax);
      
                        
        val1=0;
        val2=0;
        for k = windowIMin:windowIMax
        	for l = windowJMin:windowJMax
                   
    	        if(k==i1 && l==j1) continue; end;
                                
                movingPatch = padImage(k-patchSize:k+patchSize , l-patchSize:l+patchSize);  
                movingPatchIMin = k-patchSize;
                movingPatchJMin = l-patchSize;
                movingPatchIMax = k+patchSize;
                movingPatchJMax = l+patchSize;
                
                expVal = exp(((-1)*((sum(sum((movingPatch-fixedPatch))))))/h^2); 
                val1 = val1 + expVal;
                val2 = val2 + (expVal*padImage(k,l));
               
            end
        end
        
        out(i,j) = val2/val1;
        % fprintf(1, 'val1 = %f, val2 = %f\n', val1, val2);
    
    end
end

timeElapsed = toc(startTime);

%% Calculating RMSD
[row2, col2] = size(in);
difference = (in-out).^2;
rmsd = sum(sum(difference));
rmsd = rmsd/(row2*col2);
rmsd = sqrt(rmsd);

fprintf(1, 'RMSD = %f\n', rmsd);
fprintf(1, 'My Patch Based Filtering takes %f seconds\n', timeElapsed);





