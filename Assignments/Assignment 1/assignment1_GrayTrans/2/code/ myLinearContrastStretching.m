%% myLinearContrastStretching.m
% Implements Linear Contrast Stretching
% in  - Input Image
% out - Output Image

function [out] = myLineaContrastStretching(in)


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
		m = max(max(in));
		m = double(m);
		n = min(min(in));
		n = double(n);
		out = zeros(row, col, 'uint8');
		
		for i = 1:row
		    for j = 1:col
		        new(i,j) = (double((in(i,j))-n)/(m-n))*(255);
		        new(i,j) = round(new(i,j));
		    end
		end
		
	end
	% End of loop function


end