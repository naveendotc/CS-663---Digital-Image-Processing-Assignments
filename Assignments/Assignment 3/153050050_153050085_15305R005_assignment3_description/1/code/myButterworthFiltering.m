function [noisy,out]=myButterworthFiltering(in, d0)

[row col]=size(in);
%adding gaussian noise
meanIn = 0;
varianceIn = 0.1*(max(max(in))-min(min(in)));
in = im2double(in);
noisy = in + sqrt(varianceIn)*randn(row,col) + meanIn; % Noisy Image

%butterworth filter
n = 2; % Order of butterworth filter
[x, y] = meshgrid(-floor(col/2):floor(col-1)/2,-floor(row/2):floor(row-1)/2);
H = 1./(1.+((sqrt(x.^2+y.^2)./d0).^(2*n))); %H(u, v)

figure('Name','Butterworth filter'),imagesc(H);title('Butterworth filter');colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
new = fftshift(fft2(noisy)); % Fourier transform of Noisy Image

new1=new;
new=abs(new);
total_pow=sum(sum(new.^2)); % Total Power of original image

x0=row/2;
y0=col/2;
r=10; % Radius of circular mask
[x,y]=meshgrid(-(y0-1):(col-y0),-(x0-1):(row-x0));
c_mask=((x.^2+y.^2)<=r^2); % Circular mask

cropped=c_mask.*(log(1+new)); % Cropped image from original image
cropped=cropped.*(log(1+new));
figure;imagesc(c_mask);title('Circular Disk Mask');colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
figure;imagesc(log(1+new));title('Fourier Transform of noisy image');colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
figure;imagesc(cropped);title('Cropped');colormap(gray); axis tight; impixelinfo; 
colorbar('southoutside'); daspect ([1 1 1]);
cropped1=c_mask.*(new); % Cropped image from original image
cropped1=cropped1.*(new);

pow=sum(sum(cropped1));
perc=(pow/total_pow)*100;
fprintf(1, 'Percentage of power spectrum= %f\n', perc);
pro=new1.*H;
out=ifft2(pro);
out=abs(out);
dim=row*col;
r=(in-out).^2;
rmsd=sqrt((1/dim)*sum(sum(r)));
fprintf(1, 'RMSD = %f\n', rmsd);

end

