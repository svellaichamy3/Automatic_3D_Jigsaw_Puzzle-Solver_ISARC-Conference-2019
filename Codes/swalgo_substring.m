function [vec1sub,vec2sub] = swalgo_substring(vec1,vec2,th)
m=length(vec1);
n=length(vec2);
A=zeros(m+1,n+1);
Up=zeros(m+1,n+1);
Left=zeros(m+1,n+1);
Diag=zeros(m+1,n+1);

for i=2:m+1
    for j = 2:n+1
        if(CalcDistance3D(vec1(1,i-1), vec1(2,i-1),vec1(3,i-1),vec2(1,j-1), vec2(2,j-1),vec2(3,j-1))<0.15)
            s=1;
        else s=-1;
        end
        penalty=1;
        p=0;
        for z=i-1:2
            temp=A(z,j)-penalty;
            penalty=penalty+1;
            if (temp>p) p=temp;
            end
        end
        penalty=1
        k=0;
         for z=j-1:2
            temp=A(i,z)-penalty;
            penalty=penalty+1;
            if (temp>k) k=temp;
            end
        end
        A(i,j)=max([A(i-1,j-1)+s,0,p,k]);
        if(A(i,j)==A(i-1,j-1)+s) 
            Diag(i,j)= 1;
        end
        if(A(i,j)==p) 
            Up(i,j)= 1;
        end
        if(A(i,j)==k) 
            Left(i,j) = 1;
        end
        p=0;k=0;
    end
end

[rowsOfMaxes colsOfMaxes] = find(A == max(A(:)));
l=length(rowsOfMaxes);
str1=[];
str2=[];
for y =1:l
    
    i = rowsOfMaxes(y);
    j = colsOfMaxes(y);    
   
    while A(i,j)~=0
        str1=[str1 i-1];
        str2=[str2 j-1];
        
        
        if (Diag(i,j)==1)
            i=i-1;
            j=j-1;
        
        else
            if (Up(i,j)==1)
                i=i-1;
            else
                if (Left(i,j)==1)
                 j=j-1;
                end
            end
        end
        
    
    end

% g=sprintf('%d ', str1);
%fprintf('Answer: %s\n', g)

 
 str1{y}.index=str1;
 str2{y}.index=str2;
 
    %print(str2)
   str1=[];
  str2=[];
    
    
end





end
