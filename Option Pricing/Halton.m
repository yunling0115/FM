function H = Halton(m,n) % generate n numbers with m as the base
for i = 1:n
    k=i; j=1; h=0;
    while k>0
        a(j)=mod(k,m);
        k=(k-a(j))/m;
        h=a(j)/(m^j)+h;
        j=j+1;
    end
    H(i)=h;
end
        