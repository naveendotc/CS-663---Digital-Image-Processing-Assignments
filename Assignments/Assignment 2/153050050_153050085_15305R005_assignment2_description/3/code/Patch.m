%function [out]=Patch(in)
clear all 
close all
in=imread('C:\Users\swaresh\Dropbox\CS 663 - Digital Image Processing\Assignments\Assignment 1\153050050_153050085_15305R005_assignment1_description\2\data\barbara.png');
[imgrow imgcol]=size(in);
in = in(1:2:imgrow, 1:2:imgcol);
[imgrow imgcol]=size(in);
out=zeros(imgrow/2,imgcol/2);
w1=4;
w2=12;
parpool;
for i=13:imgrow-13
    for j=13:imgcol-13
        
        FpatchiMin = max(i-w1,1);
        FpatchiMax = min(i+w1,imgrow);
        FpatchjMin = max(j-w1,1);
        FpatchjMax = min(j+w1,imgcol);
        WindowiMin = max(i-w2,1);
        WindowiMax = min(i+w2,imgrow);
        WindowjMin = max(j-w2,1);
        WindowjMax = min(j+w2,imgcol);
        window=in(WindowiMin:WindowiMax,WindowjMin:WindowjMax);
        [winrow wincol]=size(window);
       
        winrow=WindowiMin+winrow-1;
        wincol=WindowjMin+wincol-1;
         winrow
        wincol
        val1=0;
        val2=0;
        wsum=0;
        for k=WindowiMin:winrow
        	for l=WindowjMin:wincol
                   
        		    VpatchiMin = max(k-w1,1);
       				VpatchiMax = min(k+w1,winrow);
        			VpatchjMin = max(l-w1,1);
        			VpatchjMax = min(l+w1,wincol);
                    VariablePatch=in(VpatchiMin:VpatchiMax,VpatchjMin:VpatchjMax);
                    Fpatch=in(FpatchiMin:FpatchiMax,FpatchjMin:FpatchjMax);
                    [Vrow Vcol]=size(VariablePatch);
                    [Frow Fcol]=size(Fpatch);
        			if(VpatchiMin==WindowiMin && VpatchjMin==WindowjMin)
        				NpatchiMin=FpatchiMin+((FpatchiMax-FpatchiMin)-(VpatchiMax-VpatchiMin));
        				NpatchiMax=FpatchiMax;
        				NpatchjMin=FpatchjMin+((FpatchjMax-FpatchjMin)-(VpatchjMax-VpatchjMin));
        				NpatchjMax=FpatchjMax;
        			elseif(VpatchiMax==WindowiMax && VpatchjMin==WindowjMin)
        				NpatchiMin=FpatchiMin;
        				NpatchiMax=FpatchiMin+(VpatchiMax-VpatchiMin);
        				NpatchjMin=FpatchjMin+((FpatchjMax-FpatchjMin)-(VpatchjMax-VpatchjMin));
        				NpatchjMax=FpatchjMax;
        			elseif(VpatchiMax==WindowiMax && VpatchjMax==WindowjMax)
        				NpatchiMin=FpatchiMin;
        				NpatchiMax=FpatchiMin+(VpatchiMax-VpatchiMin);
        				NpatchjMin=FpatchjMin;
        				NpatchjMax=FpatchjMin+(VpatchjMax-VpatchjMin);
        			elseif(VpatchiMin==WindowiMin && VpatchjMax==WindowjMax)
        				NpatchiMin=FpatchiMin+((FpatchiMax-FpatchiMin)-(VpatchiMax-VpatchiMin));
        				NpatchiMax=FpatchiMax;
        				NpatchjMin=FpatchjMin;
        				NpatchjMax=FpatchjMin+(VpatchjMax-VpatchjMin);
        			elseif(VpatchiMin==WindowiMin)
        				NpatchiMin=FpatchiMin+((FpatchiMax-FpatchiMin)-(VpatchiMax-VpatchiMin));
        				NpatchiMax=FpatchiMax;
        				NpatchjMin=FpatchjMin;
        				NpatchjMax=FpatchjMax;
        			elseif(VpatchjMin==WindowjMin)
        				NpatchiMin=FpatchiMin;
        				NpatchiMax=FpatchiMax;
        				NpatchjMin=FpatchjMin+((FpatchjMax-FpatchjMin)-(VpatchjMax-VpatchjMin));
        				NpatchjMax=FpatchjMax;
        			elseif(VpatchiMax==WindowiMax)
        				NpatchiMin=FpatchiMin;
        				NpatchiMax=FpatchiMin+(VpatchiMax-VpatchiMin);
        				NpatchjMin=FpatchjMin;
        				NpatchjMax=FpatchjMax;
        			elseif(VpatchjMax==WindowjMax)
        				NpatchiMin=FpatchiMin;
        				NpatchiMax=FpatchiMax;
        				NpatchjMin=FpatchjMin;
        				NpatchjMax=FpatchjMin+(VpatchjMax-VpatchjMin);
        			else
        				NpatchiMin=FpatchiMin;
        				NpatchiMax=FpatchiMax;
        				NpatchjMin=FpatchjMin;
        				NpatchjMax=FpatchjMax;

                       
                    end
                     NewPatch=in(NpatchiMin:NpatchiMax,NpatchjMin:NpatchjMax);
                    
                    else
                        Vrow
                        Vcol
                        Frow
                        Fcol
                if(FpatchiMin==WindowiMin && FpatchjMin==WindowjMin)
                    if(k<=winrow-w1 && l<=Wincol-w1)
                        VpatchiMin=VpatchiMin+((VpatchiMax-VpatchiMin)-(FpatchiMax-FpatchiMin));
                        VpatchiMax=VpatchiMax;
                        VpatchjMin=VpatchjMin+((VpatchjMax-VpatchjMin)-(FpatchjMax-FpatchjMin));
                        VpatchjMax=VpatchjMax;
                    else
                        flag=1;

                    elseif(FpatchiMax==WindowiMax && FpatchjMin==WindowjMin)
                        VpatchiMin=VpatchiMin;
                        VpatchiMax=VpatchiMin+(FpatchiMax-FpatchiMin);
                        VpatchjMin=VpatchjMin+((VpatchjMax-VpatchjMin)-(FpatchjMax-FpatchjMin));
                        VpatchjMax=VpatchjMax;
                    elseif(FpatchiMax==WindowiMax && FpatchjMax==WindowjMax)
                        VpatchiMin=VpatchiMin;
                        VpatchiMax=VpatchiMin+(FpatchiMax-FpatchiMin);
                        VpatchjMin=VpatchjMin;
                        VpatchjMax=VpatchjMin+(FpatchjMax-FpatchjMin);
                    elseif(FpatchiMin==WindowiMin && FpatchjMax==WindowjMax)
                        VpatchiMin=VpatchiMin+((VpatchiMax-VpatchiMin)-(FpatchiMax-FpatchiMin));
                        VpatchiMax=VpatchiMax;
                        VpatchjMin=VpatchjMin;
                        VpatchjMax=VpatchjMin+(FpatchjMax-FpatchjMin);
                    elseif(FpatchiMin==WindowiMin)
                        VpatchiMin=VpatchiMin+((VpatchiMax-VpatchiMin)-(FpatchiMax-FpatchiMin));
                        VpatchiMax=VpatchiMax;
                        VpatchjMin=VpatchjMin;
                        VpatchjMax=VpatchjMax;
                    elseif(FpatchjMin==WindowjMin)
                        VpatchiMin=VpatchiMin;
                        VpatchiMax=VpatchiMax;
                        VpatchjMin=VpatchjMin+((FpatchjMax-FpatchjMin)-(VpatchjMax-VpatchjMin));
                        VpatchjMax=VpatchjMax;
                    elseif(FpatchiMax==WindowiMax)
                        VpatchiMin=VpatchiMin;
                        VpatchiMax=VpatchiMin+(VpatchiMax-VpatchiMin);
                        VpatchjMin=VpatchjMin;
                        VpatchjMax=VpatchjMax;
                    elseif(FpatchjMax==WindowjMax)
                        VpatchiMin=VpatchiMin;
                        VpatchiMax=VpatchiMax;
                        VpatchjMin=VpatchjMin;
                        VpatchjMax=VpatchjMin+(VpatchjMax-VpatchjMin);
                    
                        
                    end
            NewPatch=in(FpatchiMin:FpatchiMax,FpatchjMin:FpatchjMax);
            
            VariablePatch=in(VpatchiMin:VpatchiMax,VpatchjMin:VpatchjMax);
            end

        	
            [patchrow patchcol]=size(VariablePatch);
%             
        	
        	
        	q=0;
        	h=1;
            e=zeros(patchrow,patchcol);
           
        	for t=1:patchrow
        		for r=1:patchcol
        		q=q+1;		
        		e(t,r)=exp((-1)*((norm(double(VariablePatch(t,r)-NewPatch(t,r)))^2)/h^2));
        		end
        	end
        	esum=sum(sum(e));
            w=zeros(patchrow,patchcol);
        	
        	for t=1:patchrow
        		for r=1:patchcol
        			w(t,r)=e(t,r)/esum;
        			wsum=wsum+(w(t,r)*in(k,l));
        		end
        	end	
        end
     end
     
     out(i,j)=wsum;

    end
  end
  figure;
imshow(in);
figure;
imshow(out);

%end




