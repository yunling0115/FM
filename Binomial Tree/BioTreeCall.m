function C = BioTreeCall(S0,T,X,r,sigma,delta,u,d,p)
n = T./delta;
for i = 1:n+1
    terminal(i) = max(S0*u^(i-1)*d^(n-(i-1))-X,0);
    prob(i) = combin(n,i-1)*p^(i-1)*(1-p)^(n-(i-1));
end
C = exp(-r*T)*sum(terminal.*prob);