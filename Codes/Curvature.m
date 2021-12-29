function cu=Curvature(a,b,c)
a1=Distance(a,b);
b1=Distance(c,b);
c1=Distance(c,a);
s=0.5*(a1+b1+c1);
area = sqrt(s*(s-a1)*(s-b1)*(s-c1));
den = a1*b1*c1;
cu = (4*area)/den;
end