img=imread('a.jpg');
imshow(img);
gray=rgb2gray(img);
imshow(gray);
figure;
imhist(gray);
figure;
[row col]=size(gray);
freq=zeros(1,256);
p=zeros(1,256);
c=zeros(1,256);
s=zeros(1,256);
s1=zeros(1,256);
out_image=zeros(row,col,'uint8');
for i=1:row
    for j=1:col
        freq(gray(i,j)+1)=freq(gray(i,j)+1)+1;
    end
end
no_pixels=row*col;
for i=1:256
    p(i)=freq(i)/no_pixels;
    if(i==1)
        c(i)=p(i);
    else
        c(i)=p(i)+c(i-1);
    end
    s(i)=255*c(i);
    s(i)=round(s(i));
end
for i=1:row
    for j=1:col
        k=gray(i,j);
        out_image(i,j)=s(k+1);
    end
end
imshow(out_image);
figure;
imhist(out_image);