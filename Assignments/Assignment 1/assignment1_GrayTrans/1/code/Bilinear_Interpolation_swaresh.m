clc
clear all
close all
a=imread('C:\Users\swaresh\Documents\MATLAB\dip\assignment1_GrayTrans\assignment1_GrayTrans\1\data\barbaraSmall.png');      

[row col d] = size(a);  %3 dimentional array
zoom=2;                 %zooming factor
zr=3*row-2;
zc=2*col-1;

for i=1:zr
    
    x=i/3;
    
    x1=floor(x);
    x2=ceil(x);
    if x1==0
        x1=1;
    end
    xint=rem(x,1);
    for j=1:zc
        
        y=j/2;
        
        y1=floor(y);
        y2=ceil(y);
        if y1==0
            y1=1;
        end
        yint=rem(y,1);
        
        BL=a(x1,y1,:);
        TL=a(x1,y2,:);
        BR=a(x2,y1,:);
        TR=a(x2,y2,:);
        
        R1=BR*xint+BL*(1-xint);
        R2=TR*xint+TL*(1-xint);
        
        im_zoom(i,j,:)=R1*yint+R2*(1-yint);
    end
end
imshow(im_zoom);
[r t o]=size(im_zoom);