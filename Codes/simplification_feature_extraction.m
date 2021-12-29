no = 9;
[len,ang,cur,dercurv,tor] = Extract(A,no);
for i = 1:9
A1{i} = rev(A{i})
end
[rlen,rang,rcur,rdercurv,rtor] = Extract(A1,no);
[nlen,nrlen]=min_max(len,rlen);
[nang,nrang]=min_max(ang,rang);
[ncur,nrcur]=min_max(cur,rcur);
[ndercurv,nrdercurv]=min_max(dercurv,rdercurv);
[ntor,nrtor]=min_max(tor,rtor);

for i = 1:9
   Perimeter(i) = Peri(A{i});
end
