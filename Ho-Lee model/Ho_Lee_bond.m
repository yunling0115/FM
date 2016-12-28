function P = Ho_Lee_bond(T,k,r_mean,r0,sigma,n,delta)
r = Ho_Lee(T,k,r_mean,r0,sigma,n,delta);
P = mean(exp(-sum(r)*delta));