function P = Gaussian_bond(T,k,r_mean,r0,sigma,n,delta,sigma1,sigma2,numbda)
r = Gaussian(T,k,r_mean,r0,sigma,n,delta,sigma1,sigma2,numbda);
P = mean(exp(-sum(r)*delta));