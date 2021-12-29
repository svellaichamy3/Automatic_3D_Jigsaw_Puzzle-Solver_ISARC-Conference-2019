function [len,ang,cur,dercurv,tor] = Extract(A,no)
for k = 1:no
   ps=A{k};

for i = 2:size(ps,1)-1
    len{k}(i)= log((Distance(ps(i-1,:),ps(i,:))+Distance(ps(i+1,:),ps(i,:)))/2);
    ang{k}(i)= Angle(ps(i-1,:),ps(i,:),ps(i+1,:));
    cur{k}(i) = log(Curvature(ps(i-1,:),ps(i,:),ps(i+1,:)));
end
len{k}(size(ps,1)) = log((Distance(ps(2,:),ps(1,:))+ Distance(ps(size(ps,1)-1,:),ps(1,:)))/2);
len{k}(1)=len{k}(size(ps,1));
ang{k}(size(ps,1)) = Angle(ps(size(ps,1)-1,:),ps(1,:),ps(2,:));
ang{k}(1)= ang{k}(size(ps,1));
cur{k}(size(ps,1)) = log(Curvature(ps(size(ps,1)-1,:),ps(1,:),ps(2,:)));
cur{k}(1)= cur{k}(size(ps,1));

for i = 3:size(ps,1)-2
    dercurv{k}(i)= DerCurv(ps(i-2,:),ps(i-1,:),ps(i,:),ps(i+1,:),ps(i+2,:));
end
dercurv{k}(2)= DerCurv(ps(size(ps,1)-1,:),ps(1,:),ps(2,:),ps(3,:),ps(4,:));
dercurv{k}(size(ps,1)-1)=dercurv{k}(2);
dercurv{k}(1)= DerCurv(ps(size(ps,1)-2,:),ps(size(ps,1)-1,:),ps(1,:),ps(2,:),ps(3,:));
dercurv{k}(size(ps,1))=dercurv{k}(1);

for i = 3:size(ps,1)-2
    tor{k}(i)= Torsion(ps(i-2,:),ps(i-1,:),ps(i,:),ps(i+1,:),ps(i+2,:));
end
tor{k}(2)= Torsion(ps(size(ps,1)-1,:),ps(1,:),ps(2,:),ps(3,:),ps(4,:));
tor{k}(size(ps,1)-1)=tor{k}(2);
tor{k}(1)= Torsion(ps(size(ps,1)-2,:),ps(size(ps,1)-1,:),ps(1,:),ps(2,:),ps(3,:));
tor{k}(size(ps,1))=tor{k}(1);

end
end