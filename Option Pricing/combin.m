function c = combin(n,m)
% c = n!/m!/(n-m)!=n*(n-1)*...(n-m+1)/(m*(m-1)*...*1)
d = 1;
for i = 1:m
    d = d*(n+1-i)/(m+1-i);
end
c = d;
