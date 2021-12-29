function a = rev(b)

for i =1:length(b)
    a(i,:)=b(length(b)-i+1,:)    
end


end
