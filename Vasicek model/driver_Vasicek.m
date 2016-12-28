clear all; close all; clc
n = 1000; delta = 0.5/182;
r0 = 0.03; sigma = 0.015; k = 0.2; r_mean = 0.05;
% part a:
    Principle = 100; T = 0.5; t = 0;
    P1 = Vasicek_bond(Principle,t,T,k,r_mean,r0,sigma,n,delta);
    display('Part a: bond price');
    P1
% part b:
    K = 95; T = 0.25; S = 0.5;
    r = Vasicek(t,T,k,r_mean,r0,sigma,n,delta);
    rT = mean(r(length(r))); % use as the initial value for P(T,S)
    % 1) Use Bond price caculated similarly in part a:
    P2 = Vasicek_bond(Principle,t,T,k,r_mean,r0,sigma,n,delta);
    C2(1) = mean(exp(-sum(r)*delta).*max(P1/P2*Principle-K,0)); % P(T,S)=P(t,S)/P(t,T)
    % 2) Use Bond price from the formula:
    B = 1/k*(1-exp(-k*(S-T)));
    A = exp((r_mean-sigma^2/2/k^2)*(B-(S-T))-sigma^2/4/k*B^2);
    P = Principle*A*exp(-B*rT);
    C2(2) = mean(exp(-sum(r)*delta).*max(P-K,0));
    display('Part b: call price');
    display('Using bond price in part a');
    C2(1)
%     display('Using bond price by formula');
%     C2(2)
% part c:
    % bond price:
    T = 0.5; t = 0;
    B = 1/k*(1-exp(-k*(T-t)));
    A = exp((r_mean-sigma^2/2/k^2)*(B-(T-t))-sigma^2/4/k*B^2);
    P = Principle*A*exp(-B*r0);
    P3(1) = P;
    % call price:
    K = 95; T = 0.25; S = 0.5;
    K = K/Principle;
    B = 1/k*(1-exp(-k*(S-t)));
    A = exp((r_mean-sigma^2/2/k^2)*(B-(S-t))-sigma^2/4/k*B^2);
    P3(1) = A*exp(-B*r0);
    B = 1/k*(1-exp(-k*(T-t)));
    A = exp((r_mean-sigma^2/2/k^2)*(B-(T-t))-sigma^2/4/k*B^2);
    P3(2) = A*exp(-B*r0);
    sigma_p = sqrt((1-exp(-2*k*(T-t)))/2/k)*((1-exp(-k*(S-T)))/k)*sigma;
    d1 = log(P3(1)/K/P3(2))/sigma_p+sigma_p/2;
    d2 = d1-sigma_p;
    C3 = P3(1)*NORM(d1)-K*P3(2)*NORM(d2);
    C3 = C3*Principle;
    display('Part c: bond price and call price');
    P
    C3
    display('Error of bond price');
    abs(P-P1)
    display('Error of call price');
    abs(C2(1)-C3)


