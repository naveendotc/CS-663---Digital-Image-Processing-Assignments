
%% myCLAHE.m
% Implements Context Linear Adaptive Histogram Equalization
% in  - Input Image
% out - Output Image

function [out] = myCLAHE(in, windowsize, clip)

    if nargin == 1
        windowsize = 3;
    end
    if ndims(in) == 3
        in1 = in(:,:,1);
        in2 = in(:,:,2);
        in3 = in(:,:,3);
        out1 = loop(in1);
        out2 = loop(in2);
        out3 = loop(in3);
        out(:,:,1) = out1;
        out(:,:,2) = out2;
        out(:,:,3) = out3;
    else
        out = loop(in);
    end

    % Function Loop
    function [out] = loop(in)
    
        r = floor((windowsize-1)/2);
        k = floor((windowsize+1)/2);

        [row, col] = size(in);
        out = zeros(row, col);
        in_ = (-1)*(ones(row+(2*r), col+(2*r)));
        [row1, col1] = size(in_);
        in_(k:row1-k+1,k:col1-k+1)=in;
        %disp(in_(1,1));
        
        for i=k:row1-k+1
            for j=k:col1-k+1
                %window = in(i-r:i-r+windowsize-1,j-r:j-r+windowsize-1);
                window = in_(i-r:i-r+windowsize-1,j-r:j-r+windowsize-1);
                %disp(window);
                %fprintf(1, '%d\n', k);
                %fprintf(1, '%d %d %d %d\n', i,j,in_(i,j),in(1,1));
                freq_count = zeros(1, 256, 'uint8');
                sum = 0;
                for k1 = 1:windowsize
                    for l1 = 1:windowsize
                        if window(k1,l1)>-1
                            freq_count(window(k1,l1)+1) = freq_count(window(k1,l1)+1)+1;
                        end
                    end
                end
                plot(freq_count,1:256);
                freq_cut = floor(clip*max(freq_count));
                for k1 = 1:256
                    if freq_count(k1)>freq_cut
                        sum = sum + (freq_count(k1)-freq_cut);
                    end
                end
                sum = floor(sum/256);
                remainder = rem(sum,256);
                freq_count(1)=freq_count(1)+remainder;
                for k1 = 1:256
                    freq_count(k1) = freq_count(k1) + sum;
                end
                plot(freq_count,1:256);
                %out(i,j) = claheHelper(freq_count, in(i,j));
                out(i-r,j-r) = claheHelper(freq_count, in_(i,j));
                
            end
        end
        out = uint8(out);
    end
    % End of loop function

    function [s1] = claheHelper(freq, val)
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

end