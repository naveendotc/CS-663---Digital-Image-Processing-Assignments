%% myAHE.m
% Implements Adaptive Histogram Equalization
% in  - Input Image
% out - Output Image

function [out] = myAHE(in, windowsize)
    
    if nargin == 1
        windowsize = 3;
    end
    if ndims(in) == 3
        in1 = in(:,:,1);
        in2 = in(:,:,2);
        in3 = in(:,:,3);
        out_1 = loop(in1);
        out_2 = loop(in2);
        out_3 = loop(in3);
        out(:,:,1) = out_1;
        out(:,:,2) = out_2;
        out(:,:,3) = out_3;
    else
        out = loop(in);
    end

    % Function Loop
    function [out] = loop(in)
    
        r = floor((windowsize-1)/2);
        k = floor((windowsize+1)/2);

        [row, col] = size(in);
        out = zeros(row, col, 'uint8');
        in1=(-1)*(ones(row+(2*r), col+(2*r), 'uint8'));
        [row1, col1] = size(in1);

        in1(k:row1-k+1,k:col1-k+1)=in;
        
        for i=k:row1-k+1
            for j=k:col1-k+1
                
                %window = in(i-r:i-r+windowsize-1,j-r:j-r+windowsize-1);
                window = in1(i-r:i-r+windowsize-1,j-r:j-r+windowsize-1);
                freq_count = zeros(1, 256, 'uint8');
                sum = 0;
                for k1 = 1:windowsize
                    for l1 = 1:windowsize
                        if window(k1,l1)>=0
                            freq_count(window(k1,l1)+1) = freq_count(window(k1,l1)+1)+1;
                        end
                    end
                end
                
                out(i-r,j-r)=aheHelper(freq_count,in1(i,j));          
                
            end
        end
        
        
        
    end
    % End of loop function

            
    function [s1] = aheHelper(freq, val)
        p  = zeros(1,256);     % Probability of occurrence of pixels
        c  = zeros(1,256);     % Cumulative Sum obtained from probabilities
        s  = zeros(1,256);     % Mapping of input pixels to output pixels
        for i = 1:256
            p(i) = freq(i)/windowsize;
            if i == 1
                c(i) = p(i);
            else
                c(i) = p(i)+c(i-1);
            end
            s(i) = 255*c(i);
            s(i) = round(s(i));
        end
        s1=s(val+1);
    end
    % End of helper function

end