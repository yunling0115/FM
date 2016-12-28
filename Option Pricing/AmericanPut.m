function AP = AmericanPut(S0,T,X,r,sigma,delta,u,d,p)
n = T./delta;
R = exp(r*delta);
P = zeros(n+1,n+1);
for j = 1:n+1
    P(n+1,j) = max(X-S0*u^(j-1)*d^(n-(j-1)),0);
end
% Backwards:
for i = 1:n
    for j = 1:n+1-i
        P(n+1-i,j) = max(X-S0*u^(j-1)*d^(((n+1-i)-1)-(j-1)),(p*P((n+1-i)+1,j+1)+(1-p)*P((n+1-i)+1,j))/R);
    end
end
AP = P(1,1);    