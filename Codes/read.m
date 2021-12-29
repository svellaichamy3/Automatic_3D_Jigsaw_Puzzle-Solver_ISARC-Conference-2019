trial= read_wobj_fun();  %Execute this to choose the obj

 FV.vertices=trial.vertices;
 FV.faces=trial.objects(5).data.vertices;
 figure, patch(FV,'facecolor',[1 0 0]);camlight
 
 
TR = triangulation(FV.faces,FV.vertices);

FE = featureEdges(TR,pi/6);
%C= union(FE(:,1),FE(:,2));
Temp= FE;
C=zeros(0,0);
C(1)= Temp(1,1); C(2)= Temp(1,2); next = Temp(1,2);Temp(1,:)=[];

for j = 3:size(FE,1)+1
  [tf,loc]=ismember(Temp,next);
  k=mod(find(loc),size(Temp,1));
  if k==0
      k=size(Temp,1);
  end
  if Temp(k,1)==next
      C(j)=Temp(k,2);
      next= C(j);
      Temp(k,:)=[];
  else
      C(j)=Temp(k,1);
      next= C(j);
      Temp(k,:)=[];
  end
  
end

array = zeros(0,3);

for i = 1:size(FE,1)+1
    array = [array;FV.vertices(C(i),:)];
end
 
plot3(array(:,1),array(:,2),array(:,3))


trial1= read_wobj_fun();  %Execute this to choose the obj

 FV1.vertices=trial1.vertices;
 FV1.faces=trial1.objects(5).data.vertices;
 figure, patch(FV1,'facecolor',[1 0 0]);camlight
 
 
 TR = triangulation(FV1.faces,FV1.vertices);

FE = featureEdges(TR,pi/6);
%C= union(FE(:,1),FE(:,2));
Temp= FE;
C1=zeros(0,0);
C1(1)= Temp(1,1); C1(2)= Temp(1,2); next = Temp(1,2);Temp(1,:)=[];

for j = 3:size(FE,1)+1
  [tf,loc]=ismember(Temp,next);
  k=mod(find(loc),size(Temp,1));
  if k==0
      k=size(Temp,1);
  end
  if Temp(k,1)==next
      C1(j)=Temp(k,2);
      next= C1(j);
      Temp(k,:)=[];
  else
      C1(j)=Temp(k,1);
      next= C1(j);
      Temp(k,:)=[];
  end
  
end

array1 = zeros(0,3);

for i = 1:size(FE,1)+1
    array1 = [array1;FV1.vertices(C1(i),:)];
end
 
plot3(array1(:,1),array1(:,2),array1(:,3))


