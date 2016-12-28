function P = Vasicek_bond(Principle,t,T,k,r_mean,r0,sigma,n,delta) % Use n r's to generate one value
r = Vasicek(t,T,k,r_mean,r0,sigma,n,delta);
P = Principle*mean(exp(-sum(r)*delta));
