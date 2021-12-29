function c3=Torsion(a,b,c,d,e)

a1=Distance(c,b);
b1=Distance(c,d);
c1=Distance(b,d);
s=0.5*(a1+b1+c1);
area = sqrt(s*(s-a1)*(s-b1)*(s-c1));

v1=dot(e-b,cross(e-c,e-d))/6;
v2=dot(a-d,cross(a-c,a-b))/6;
H1=(3*v1)/area;
num1=6*H1;
H2=(3*v2)/area;
num2=6*H2;
den1=Curvature(b,c,d)*Distance(e,b)*Distance(e,c)*Distance(e,d);
den2=Curvature(b,c,d)*Distance(a,d)*Distance(a,c)*Distance(a,b);
c1=abs(num1/den1);
c2=abs(num2/den2);
c3=(c1+c2)/2;


end
