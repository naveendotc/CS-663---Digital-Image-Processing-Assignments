clc
clear all
close all
a=imread('../data/barbaraSmall.png');      

[row col d] = size(a);  %3 dimentional array
zoom=2;                 %zooming factor
zr=zoom*row;
zc=zoom*col;

for i=1:zr
    
    x=i/zoom;
    
    x1=floor(x);
    x2=ceil(x);
    if x1==0
        x1=1;
    end
    xint=rem(x,1);
    for j=1:zc
        
        y=j/zoom;
        
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
        
        R1=BR*yint+BL*(1-yint);
        R2=TR*yint+TL*(1-yint);
        
        im_zoom(i,j,:)=R1*xint+R2*(1-xint);
    end
end
imshow(im_zoom);