% base connectivity score

i1 = 2;
i2 = 3;

r=plot3(A{i1}(:,1),A{i1}(:,2),A{i1}(:,3));
r.Color='cyan'
hold on;

s=plot3(A1{i2}(:,1),A1{i2}(:,2),A1{i2}(:,3));
s.Color='black'
hold on;

connectivity = (Peri(A{i1}(75:81,:))+Peri(A{i1}(1:1,:)))/min(Perimeter(i1),Perimeter(i2));