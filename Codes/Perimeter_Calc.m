function sum=Peri(a)
sum =0;
for i = 1:size(a,1)-1
sum = sum+Distance(a(i,:),a(i+1,:));
end
end