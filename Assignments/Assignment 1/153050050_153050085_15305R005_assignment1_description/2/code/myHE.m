%% myAHE.m
% Implements Histogram Equalization
% in  - Input Image
% out - Output Image

function [out] = myHE(in)


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
		
		[row, col] = size(in);
		freq = zeros(1,256);   % Frequency Array 
		p  = zeros(1,256);     % Probability of occurrence of pixels
		c  = zeros(1,256);     % Cumulative Sum obtained from probabilities
		s  = zeros(1,256);     % Mapping of input pixels to output pixels

		out = zeros(row,col,'uint8');

		for i = 1:row
		    for j = 1:col
		        freq(in(i,j)+1) = freq(in(i,j)+1)+1;
		    end
		end

		no_pixels = row*col; % Total no. of pixels

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

		for i = 1:row
		    for j =1 :col
		        k = in(i,j);
		        out(i,j)=s(k+1);
		    end
		end

	end
	% End of loop function


end