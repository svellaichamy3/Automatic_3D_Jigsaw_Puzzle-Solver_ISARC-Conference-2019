function [len,angles,curv] = ExtractFeatures(imagename)
a = imread(imagename);
structBoundaries = bwboundaries(a);
xy=structBoundaries{1}; 
x = xy(:, 2); 
y = xy(:, 1); 
%subplot(2, 3, 1);
%hold on; 
%plot(x, y, 'LineWidth', 1);

% Approximating using douglas peuckar algo
[x1y1,~] = dpsimplify(xy,1);
x1 = x1y1(:, 2); % Columns.
y1 = x1y1(:, 1); % Rows.
%subplot(2, 3, 1); % Plot over original image.
%hold on; % Don't blow away the image.
%plot(x1, y1, 'LineWidth', 2);
clear xy x y;

n=length(x1y1);

% For each vertex obtaining log of mean of edgelengths captured in 'len'
% and interior angles
len = 1:1:n;
angles=1:1:n;
curv=1:1:n;
for j = 2:n-1
    l1 = CalcDistance(x1(j-1),y1(j-1),x1(j), y1(j));
    l2 =CalcDistance(x1(j), y1(j),x1(j+1), y1(j+1));
    l3 =CalcDistance(x1(j-1), y1(j-1),x1(j+1), y1(j+1));
    len(j)=log((l1+l2)/2);
    v1 = [x1(j) - x1(j-1), y1(j) - y1(j-1)];
    v2 = [x1(j+1) - x1(j), y1(j+1) - y1(j)];
    if (sign(det([v1; v2]))>0)
    angles(j)=acosd((l1*l1 + l2*l2 - l3*l3) / (2 * l1 * l2));
    else
     angles(j)=360-acosd((l1*l1 + l2*l2 - l3*l3) / (2 * l1 * l2));
    end
     A = 0.5*det([x1(j-1),x1(j),x1(j+1);y1(j-1),y1(j),y1(j+1);1,1,1]); 
     curv(j)=log(abs(4*A/(l1*l2*l3)));    
end
l1=CalcDistance(x1(2), y1(2),x1(1), y1(1));
l2=CalcDistance(x1(n-1), y1(n-1),x1(n), y1(n));
l3=CalcDistance(x1(n-1), y1(n-1),x1(2), y1(2));
len(1)= log((l1+l2)/2);      
len(n)=len(1);
v1 = [x1(n) - x1(n-1), y1(n) - y1(n-1)];
v2 = [x1(2) - x1(1), y1(2) - y1(1)];
if (sign(det([v1; v2]))>0)
angles(1)=acosd((l1*l1 + l2*l2 - l3*l3) / (2 * l1 * l2));
else
angles(1)=360-acosd((l1*l1 + l2*l2 - l3*l3) / (2 * l1 * l2));
end
angles(n)=angles(1);
A = 0.5*det([x1(n-1),x1(n),x1(2);y1(n-1),y1(n),y1(2);1,1,1]); 
curv(1)=log(abs(4*A/(l1*l2*l3))); 
curv(n)=curv(1);
clear n v1 v2 l1 l2 l3 x1 y1 x1y1 A j;
end
