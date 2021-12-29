function c1=DerCurv(a,b,c,d,e)
num = 3*(Curvature(a,b,c)-Curvature(c,d,e));
den = 2*Distance(b,c)+2*Distance(d,c)+Distance(d,e)+Distance(a,b);
c1=abs(num/den);
end
