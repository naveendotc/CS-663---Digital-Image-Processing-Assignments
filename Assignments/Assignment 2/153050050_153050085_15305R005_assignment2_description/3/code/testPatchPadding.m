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

% Gaussian Blur Image
G = fspecial('gaussian', [5 5], 0.66*(inpCol));
noisyImage = imfilter(inp1, G, 'same');
in = noisyImage(1:2:inpRow, 1:2:inpCol);

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

out = single(zeros(inRow, inCol));

patchSize = 4; % Actual Patch Size = 2*patchSize+1
windowSize = 12; % Actual Window Size = 2*windowSize+1
padImage = padarray(in, [patchSize patchSize]);

%fprintf(1, 'Input Matrix\n');
%disp(in);
%parpool;
h = 100000;
fprintf(1, 'Start\n' );
for i = 1:inRow
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
        % fprintf(1, 'Window\t');
        % fprintf(1, '%d %d %d %d\n',windowIMin,windowJMin,...
        %         windowIMax,windowJMax);
        % disp(window);
        % fprintf(1, 'Fixed Patch\t');
        % fprintf(1, '%d %d %d %d\n',fixedPatchIMin,fixedPatchJMin,...
        %         fixedPatchIMax,fixedPatchJMax);
        % disp(fixedPatch);
                        
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

                
                % fprintf(1, 'Moving Patch\t');
                % fprintf(1, '%d %d %d %d\n',movingPatchIMin,movingPatchJMin,...
                %         movingPatchIMax,movingPatchJMax);
                % disp(movingPatch);
                
                expVal = exp(((-1)*((sum(sum((movingPatch-fixedPatch))))))/h^2); 
                val1 = val1 + expVal;
                val2 = val2 + (expVal*padImage(k,l));
                % fprintf(1, 'expVal = %f, exp*pad = %f\n', expVal, expVal*padImage(k,l));
            end
        end
        
        out(i,j) = val2/val1;
        % fprintf(1, 'val1 = %f, val2 = %f\n', val1, val2);
    
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
subplot(1,2,1); imagesc(inp1(1:2:inpRow, 1:2:inpCol)); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
subplot(1,2,2); imagesc(in); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 
subplot(1,2,3); imagesc(out); colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]); 
%close all;

%12.167064 - 23.25 min - 100000
%14.684435 - 21.81 min - 100000
%14.684347 - 25.1 min - 1000
%14.778898 - 22.5 min - 100
%30.239807 - 25.5 min - 10
