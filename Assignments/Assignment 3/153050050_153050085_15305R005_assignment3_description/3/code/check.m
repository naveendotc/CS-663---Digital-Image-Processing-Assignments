function [y, MS] = check(in , hs, hr, th, plotOn)

startTime = tic;

%% initialization
in = double(in);
if ndims(in)==3
    [row, col, depth] = size(in);
else
    [row, col] = size(in);
end
in = double(in);
[row,col,depth] = size(in);
y = in;
% sigma = 0.01*col;
% gaussianFilter = fspecial('gaussian', [row col], sigma);
% smoothedImage = imfilter(in, gaussianFilter);
% subsampledSmoothedImage = smoothedImage(1:2:row, 1:2:col);
% y = subsampledSmoothedImage;

done = 0;
noOfIterations = 0;
if plotOn 
    figure(randi(1000)+1000); 
end

% padding image to deal with pixels on borders
%xPad = padarray(in, [row, col, 0], 'symmetric');
xPad = padarray(in, [row, col, 0]);
disp(size(in));
disp(size(xPad));
% build up look up table to boost computation speed
weight_map = exp( -(0:255^2)/hr^2 );
disp(size(weight_map));
MS = [];
%% main loop
while ~done
    weightAccum = 0;
    yAccum = 0;
    % only 99.75% area (3sigma) of the entire non-zero Gaussian kernel is considered
    for i = -hs:hs
        for j = -hs:hs
            if ( i~=0 || j~=0 )
                % spatial kernel weight 
                %spatialKernel = 1;
                % uncomment the following line to active Gausian kernel
                spatialKernel = exp(-(i^2+j^2)/(hs/3)^2/2);
                xThis =  xPad(row+i:2*row+i-1, col+j:2*col+j-1, 1:depth);
                disp(size(xThis));
                xDiffSq = (y-xThis).^2;
                %disp(xDiffSq);
                disp(size(weight_map( xDiffSq+1 )));
                % feature kernel weight
                intensityKernel = repmat( prod( reshape( weight_map( xDiffSq+1 ), row, col, depth) , 3 ), [1,1, depth]);
                % mixed kernel weight
                disp(size(intensityKernel));
                weightThis = spatialKernel.*intensityKernel;
                % update accumulated weights
                weightAccum = weightAccum+ weightThis;
                % update accumulated estimated ys from xs 
                yAccum = yAccum+xThis.*weightThis;
                disp(size(xDiffSq));
                disp(size(intensityKernel));
                disp(size(weightThis));
                disp(size(weightAccum));
                disp(size(yAccum));
            end
        end
    end
    % normalized y (see Eq.(20) in the cited paper)
    yThis = yAccum./(weightAccum+eps);
    % convergence criterion
    yMS = mean(abs(round(yThis(:))-round(y(:))));
    y = round(yThis);    
    MS(noOfIterations+1) = yMS;
    %xPad = padarray(y,[height,width,0],'symmetric');
    % if plotOn
    %     subplot(121), imshow(uint8(y)),axis image, title(['iteration times = ' num2str(noOfIterations) '; averaged mean-shift = ' num2str(yMS)]);
    %     subplot(122), plot(0:noOfIterations, MS ), xlabel('iteration #'), ylabel('averaged mean shift');axis square
    %     drawnow
    % end
    if yMS <= th || noOfIterations==1 % exit if converge
        done = 1;
    else % otherwise update estimated y and repeat mean shift
        noOfIterations = noOfIterations+1;
    end
end


timeElapsed = toc(startTime);
fprintf(1, 'My check takes %f seconds.\n', timeElapsed);

end