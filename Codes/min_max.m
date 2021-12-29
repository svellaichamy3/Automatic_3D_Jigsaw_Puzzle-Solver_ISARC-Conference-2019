function [C,D] = min_max(A,B)

minim = min(A{1});
for i = 1:length(A)
    if min(A{i})<minim
       minim = min(A{i}); 
    end
end

for i = 1:length(B)
    if min(B{i})<minim
       minim = min(B{i}) ;
    end
end

maxim = max(A{1});
for i = 1:length(A)
    if max(A{i})>maxim
       maxim = max(A{i}) ;
    end
end

for i = 1:length(B)
    if max(B{i})>maxim
       maxim = max(B{i}) ;
    end
end

for i = 1:9
   C{i}=(A{i}-minim)/(maxim-minim) ;
   D{i}=(B{i}-minim)/(maxim-minim);
end

end