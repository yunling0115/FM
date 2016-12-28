function sigma = sig(Exp_T,delta,sigma_est) % return sigma1,sigma2,sigma3 from 0 to Exp_T 
x = [0.25,0.5];
y = sigma_est(:,1:2);
a = (y(:,2)-y(:,1))/(x(2)-x(1));
b = y(:,1)-x(1)*a;
s = 0:delta:Exp_T;
sigma = a*s+b*ones(1,length(s));
