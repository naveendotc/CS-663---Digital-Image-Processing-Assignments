function [Ix, Iy, lambda1, lambda2, cornerness_measure] = myHarrisCornerDetector(inp1, sigma1, sigma2, k)
    
    %sigma=2;
    g = fspecial('gaussian',max(1,fix(6*sigma1)), sigma1);
    inp1 = conv2(inp1, g, 'same');
    
    figure,
    imagesc(inp1), colormap(gray),title('Smooth Image');axis tight; impixelinfo; 
    colorbar('southoutside'); daspect ([2 3 1]);

    pad_image=padarray(inp1,[1 1]);
    [row_sz col_sz]=size(pad_image);
    dx = [-1 0 1; -1 0 1; -1 0 1]; % Derivative masks
    dy = dx';
    
    Ix =zeros([row_sz-2 col_sz-2],'uint8');
    Iy =zeros([row_sz-2 col_sz-2],'uint8');

    out =zeros([row_sz-1 col_sz-1],'uint8');
    for i=2:row_sz-1
        for j=2:col_sz-1
            patch=pad_image(i-1:i+1,j-1:j+1);
            %ix = conv2(patch, dx, 'same');    % Image derivatives
            %iy = conv2(patch, dy, 'same');
            ix = patch.*dx;
            iy = patch.*dy;
            % Ix(i-1,j-1)=ix(2,2);
            % Iy(i-1,j-1)=iy(2,2);
            Ix(i-1,j-1) = sum(sum(ix));
            Iy(i-1,j-1) = sum(sum(iy));
        end
    end
    
    w = fspecial('gaussian',max(1,fix(6*sigma2)), sigma2);
    Ix2 = conv2(double(Ix.^2), w, 'same'); % Smoothed squared image derivatives
    Iy2 = conv2(double(Iy.^2), w, 'same');
    Ixy = conv2(double(Ix.*Iy), w, 'same');
    cornerness_measure=zeros(size(inp1),'uint8');
    %k=0.2;
    cornerness_measure = (Ix2.*Iy2 - Ixy.^2) - k*((Ix2 + Iy2).^2); % corner-ness measure
    trace=Ix2+Iy2; % sum of eigen values
    det=(Ix2.*Iy2)-(Ixy).^2; % product of eigen values
    lambda1=(trace+sqrt(trace.^2 - 4.*det))/2; % image of First Eigen Value of A
    lambda2=(trace-sqrt(trace.^2 - 4.*det))/2; % image of second eigen value of A
end