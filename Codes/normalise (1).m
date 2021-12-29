function [n1,n2,n3,n4,n5,n6,n7,n8] = normalise(x1,x2,x3,x4,x5,x6,x7,x8)
maxx=max([x1,x2,x3,x4,x5,x6,x7,x8]);
minn=min([x1,x2,x3,x4,x5,x6,x7,x8]);

n1=(x1-minn)/(maxx-minn)
n2=(x2-minn)/(maxx-minn)
n3=(x3-minn)/(maxx-minn)
n4=(x4-minn)/(maxx-minn)
n5=(x5-minn)/(maxx-minn)
n6=(x6-minn)/(maxx-minn)
n7=(x7-minn)/(maxx-minn)
n8=(x8-minn)/(maxx-minn)

end