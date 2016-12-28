function f = forward(T,delta,r0,sigma,k,r_mean) % Give the forward rate at T
t = 0:delta:T;
n = length(t);
B = 1/k*(1-exp(-k.*t));
A = exp((r_mean-sigma^2/2/k^2)*(B-t)-sigma^2/4/k*B.^2);
P = A.*exp(-B*r0);
f = -diff(log(P))/delta;