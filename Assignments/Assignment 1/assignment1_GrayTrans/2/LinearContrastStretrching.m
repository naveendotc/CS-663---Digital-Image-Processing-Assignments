close all
clear all
img=imread('C:\Users\swaresh\Documents\MATLAB\dip\assignment1_GrayTrans\assignment1_GrayTrans\2\data\barbara.png');
m=max(max(img));
m=double(m);
n=min(min(img));
n=double(n);
figure;
imhist(img);
figure;
imshow(img);
[a b]=size(img);
for i=1:a
    for j=1:b
        new(i,j)=(double((img(i,j))-n)/(m-n))*(255);
        new(i,j)=round(new(i,j));
    end
end
new=uint8(new);
figure;
imhist(new);
figure;
imshow(new);

