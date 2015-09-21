clc
clear all 
close all

startTime = tic;
%tic;
in1 = load('../../3/data/barbara.mat');
inp1 = in1.imageOrig;

[inpRow inpCol] = size(inp1);
% meanIn = 0;
% varianceIn = 0.66*(inpCol);
% inp1 = im2double(inp1);
% noisyImage = inp1 + sqrt(varianceIn)*randn(inpRow, inpCol) + meanIn;
% in = noisyImage(1:2:inpRow, 1:2:inpCol);
in = inp1(1:2:inpRow, 1:2:inpCol);

%in = randi([0 255], 8, 8);
% in = [ 208   245   107   173    70   112   181   245;
%        231   247   234   193    11    97   193    87;
%         32    40   202   190    24   195    70   149;
%        233   248   245   100   210   203   174    57;
%        161   245   167   167   177    47   167   192;
%         24   124     9    43    81   125    41    65;
%         71   204   217   180   243   114    30   129;
%        140    36   239     8     8   165   127   178
%     ];
[inRow inCol] = size(in);

out = zeros(inRow, inCol);

patchSize = 4; % Actual Patch Size = 2*patchSize+1
windowSize = 12; % Actual Window Size = 2*windowSize+1

%fprintf(1, 'Input Matrix\n');
%disp(in);
h = 2;

for i = windowSize+1:inRow-windowSize-1
    for j = windowSize+1:inCol-windowSize-1

        % Fixed Patch        
        fixedPatchIMin = max(i-patchSize, 1);
        fixedPatchIMax = min(i+patchSize, inRow);
        fixedPatchJMin = max(j-patchSize, 1);
        fixedPatchJMax = min(j+patchSize, inCol);

        % Window 
        windowIMin = max(i-windowSize, 1);
        windowIMax = min(i+windowSize, inRow);
        windowJMin = max(j-windowSize, 1);
        windowJMax = min(j+windowSize, inCol);
        window = in(windowIMin:windowIMax, windowJMin:windowJMax);
        [windowRow windowCol] = size(window);
       
        winRow = windowIMin+windowRow-1; % Index of windowIMax wrt in image
        winCol = windowJMin+windowCol-1; % Index of windowJMax wrt in image
        
        fprintf(1, 'Various Indices\n');
        fprintf(1, 'Fixed Patch\tWindow\tIn(%d,%d)\n', i, j);
        fprintf(1, '%d %d %d %d\t\t%d %d %d %d\n',fixedPatchIMin,fixedPatchJMin,...
                fixedPatchIMax,fixedPatchJMax,windowIMin,windowJMin,winRow,winCol);
        
        val1 = 0; val2 = 0;
        % val1 = sum(exp)
        % val2 = sum(exp*f)
        for k = windowIMin:winRow
        	for l = windowJMin:winCol
                   
    		    movingPatchIMin = max(k-patchSize, 1);
   				movingPatchIMax = min(k+patchSize, winRow);
    			movingPatchJMin = max(l-patchSize, 1);
    			movingPatchJMax = min(l+patchSize, winCol);
                movingPatch = in(movingPatchIMin:movingPatchIMax, movingPatchJMin:movingPatchJMax);
                fixedPatch = in(fixedPatchIMin:fixedPatchIMax, fixedPatchJMin:fixedPatchJMax);
                [variablePatchRow variablePatchCol] = size(movingPatch);
                [fixedPatchRow fixedPatchCol] = size(fixedPatch);

    			if(movingPatchIMin==windowIMin && movingPatchJMin==windowJMin)
                    % Corner 1 - Top Left
                    caseValue = 1;
    				clippedFixedPatchIMin=fixedPatchIMin+((fixedPatchIMax-fixedPatchIMin)-(movingPatchIMax-movingPatchIMin));
    				clippedFixedPatchIMax=fixedPatchIMax;
    				clippedFixedPatchJMin=fixedPatchJMin+((fixedPatchJMax-fixedPatchJMin)-(movingPatchJMax-movingPatchJMin));
    				clippedFixedPatchJMax=fixedPatchJMax;
    			elseif(movingPatchIMax==windowIMax && movingPatchJMin==windowJMin)
                    % Corner 2 - Bottom Left
    				caseValue = 2;
                    clippedFixedPatchIMin=fixedPatchIMin;
    				clippedFixedPatchIMax=fixedPatchIMin+(movingPatchIMax-movingPatchIMin);
    				clippedFixedPatchJMin=fixedPatchJMin+((fixedPatchJMax-fixedPatchJMin)-(movingPatchJMax-movingPatchJMin));
    				clippedFixedPatchJMax=fixedPatchJMax;
    			elseif(movingPatchIMax==windowIMax && movingPatchJMax==windowJMax)
                    % Corner 3 - Bottom Right
    				caseValue = 3;
                    clippedFixedPatchIMin=fixedPatchIMin;
    				clippedFixedPatchIMax=fixedPatchIMin+(movingPatchIMax-movingPatchIMin);
    				clippedFixedPatchJMin=fixedPatchJMin;
    				clippedFixedPatchJMax=fixedPatchJMin+(movingPatchJMax-movingPatchJMin);
    			elseif(movingPatchIMin==windowIMin && movingPatchJMax==windowJMax)
                    % Corner 4 - Top Right
    				caseValue = 4;
                    clippedFixedPatchIMin=fixedPatchIMin+((fixedPatchIMax-fixedPatchIMin)-(movingPatchIMax-movingPatchIMin));
    				clippedFixedPatchIMax=fixedPatchIMax;
    				clippedFixedPatchJMin=fixedPatchJMin;
    				clippedFixedPatchJMax=fixedPatchJMin+(movingPatchJMax-movingPatchJMin);
    			elseif(movingPatchIMin==windowIMin)
                    % Edge 1 - Top Edge
    				caseValue = 5;
                    clippedFixedPatchIMin=fixedPatchIMin+((fixedPatchIMax-fixedPatchIMin)-(movingPatchIMax-movingPatchIMin));
    				clippedFixedPatchIMax=fixedPatchIMax;
    				clippedFixedPatchJMin=fixedPatchJMin;
    				clippedFixedPatchJMax=fixedPatchJMax;
    			elseif(movingPatchJMin==windowJMin)
                    % Edge 2 - Left Edge
    				caseValue = 6;
                    clippedFixedPatchIMin=fixedPatchIMin;
    				clippedFixedPatchIMax=fixedPatchIMax;
    				clippedFixedPatchJMin=fixedPatchJMin+((fixedPatchJMax-fixedPatchJMin)-(movingPatchJMax-movingPatchJMin));
    				clippedFixedPatchJMax=fixedPatchJMax;
    			elseif(movingPatchIMax==windowIMax)
                    % Edge 3 - Bottom Edge
    				caseValue = 7;
                    clippedFixedPatchIMin=fixedPatchIMin;
    				clippedFixedPatchIMax=fixedPatchIMin+(movingPatchIMax-movingPatchIMin);
    				clippedFixedPatchJMin=fixedPatchJMin;
    				clippedFixedPatchJMax=fixedPatchJMax;
    			elseif(movingPatchJMax==windowJMax)
                    % Edge 4 - Right Edge
    				caseValue = 8;
                    clippedFixedPatchIMin=fixedPatchIMin;
    				clippedFixedPatchIMax=fixedPatchIMax;
    				clippedFixedPatchJMin=fixedPatchJMin;
    				clippedFixedPatchJMax=fixedPatchJMin+(movingPatchJMax-movingPatchJMin);
    			else
                    caseValue = 9;
                    clippedFixedPatchIMin=fixedPatchIMin;
    				clippedFixedPatchIMax=fixedPatchIMax;
    				clippedFixedPatchJMin=fixedPatchJMin;
    				clippedFixedPatchJMax=fixedPatchJMax;
                end
                
                fprintf(1, 'Clipped Fixed Patch\tMoving Patch\tIn(%d,%d)\tCase: %d\n', i, j, caseValue);
                fprintf(1, '%d %d %d %d\t\t%d %d %d %d\n',clippedFixedPatchIMin,clippedFixedPatchJMin,...
                        clippedFixedPatchIMax,clippedFixedPatchJMax,...
                        movingPatchIMin,movingPatchJMin,...
                        movingPatchIMax,movingPatchJMax);

                clippedFixedPatch = in(clippedFixedPatchIMin:clippedFixedPatchIMax,...
                                    clippedFixedPatchJMin:clippedFixedPatchJMax);
                
                disp(size(movingPatch));
                disp(size(clippedFixedPatch));
                expVal = exp(((-1)*(norm(movingPatch-clippedFixedPatch)).^2)/h^2); 
                val1 = val1 + expVal;
                val2 = val2 + (expVal*in(i,j));
            
            end
        end
        
        out(i,j) = val2/val1;

    
    end
end

%toc;

timeElapsed = toc(startTime);

%% Calculating RMSD
[row2, col2] = size(in);
difference = (in-out).^2;
rmsd = sum(sum(difference));
rmsd = rmsd/(row2*col2);
rmsd = sqrt(rmsd);

fprintf(1, 'RMSD = %f\n', rmsd);
fprintf(1, 'My Patch Based Filtering takes %f seconds\n', timeElapsed);


figure;
subplot(1,2,1); imagesc(in); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(out); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 




