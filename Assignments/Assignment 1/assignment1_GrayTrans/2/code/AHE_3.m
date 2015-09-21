% AHE
%
%  Takes an Image j and does adaptive histogram equalization
%  on the image with the given windowsize and n bins.
%
%  Bradley C. Grimm 
%  CS 6640 - Image Processing
%  October 1, 2009

%function [ out ] = AHE_3(in, windowsize, n)

in = randi([0 15], 5, 5);
windowsize = 3;

% if nargin < 3 
%     windowsize = size(in,1)*0.1;
% end
% if nargin < 2
%     windowsize = size(in,1)*0.1;
%     n = 256;
% end

% if rem(n,2)==0
%     return ;
% end

r = floor((windowsize-1)/2);
k = floor((windowsize+1)/2);

[row, col] = size(in);
out = zeros(row, col, 'uint8');

for i=k:row-k+1
    for j=k:col-k+1
        fprintf(1, '%d,%d\n', i,j);
        window = in(i-r:i-r+windowsize-1,j-r:j-r+windowsize-1);
        disp(window);
        [out1, s] = histoeq(window, 32, 0, 31);
        %out = out * (31);
        val = out1(k,k);
        disp(out1);
        fprintf(1,'val=%d\n',val);
        out(i,j)=val;
    end
end

fprintf(1, 'Final out\n');
disp(out);
freq_count(in(1,1)+1)=freq_count(in(1,1)+1)+1
freq_count(in(1,2)+1)=freq_count(in(1,2)+1)+1
freq_count(in(2,1)+1)=freq_count(in(2,1)+1)+1
freq_count(in(2,2)+1)=freq_count(in(2,2)+1)+1

freq_count(in(1,n)+1)=freq_count(in(1,n)+1)+1
freq_count(in(1,n-1)+1)=freq_count(in(1,n-1)+1)+1
freq_count(in(2,n-1)+1)=freq_count(in(2,n-1)+1)+1
freq_count(in(2,n)+1)=freq_count(in(2,n)+1)+1

freq_count(in(n,1)+1)=freq_count(in(n,1)+1)+1
freq_count(in(n-1,2)+1)=freq_count(in(n-1,2)+1)+1
freq_count(in(n-1,1)+1)=freq_count(in(n-1,1)+1)+1
freq_count(in(n,2)+1)=freq_count(in(n,2)+1)+1

freq_count(in(n,n)+1)=freq_count(in(n,n)+1)+1
freq_count(in(n,n-1)+1)=freq_count(in(n,n-1)+1)+1
freq_count(in(n-1,n-1)+1)=freq_count(in(n-1,n-1)+1)+1
freq_count(in(n-1,n)+1)=freq_count(in(n-1,n)+1)+1

for i=2:row-1
    freq_count(in(i,1)+1)=freq_count(in(i,1)+1)+1;
    freq_count(in(i,n)+1)=freq_count(in(i,n)+1)+1;
end

for j=2:row-1
    freq_count(in(1,j)+1)=freq_count(in(1,j)+1)+1;
    freq_count(in(n,j)+1)=freq_count(in(n,j)+1)+1;
end

for i=1:row
    for j=1:r
    end
end
function [s1] = histMake(freq_count, val)
    p  = zeros(1,256);     % Probability of occurrence of pixels
    c  = zeros(1,256);     % Cumulative Sum obtained from probabilities
    s  = zeros(1,256);     % Mapping of input pixels to output pixels
    for i = 1:256
        p(i) = freq(i)/no_pixels;
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

%end
