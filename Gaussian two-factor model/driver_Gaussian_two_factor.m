clear all; close all; clc
n = 1000; delta = 0.5/182;
r0 = 0.03; sigma = 0.015; k = 0.2; r_mean = 0.05;
sigma1 = 0.015; sigma2 = 0.025; numbda = 0.08;
% Part a:
    T = 0.5;
    % Using r(t) = f(t,t):
    P1 = Gaussian_bond(T,k,r_mean,r0,sigma,n,delta,sigma1,sigma2,numbda);
    display('Part a: bond price');
    P1
% Part b:
    K = 0.98; T = 0.25; S = 0.5;
    r = Gaussian(T,k,r_mean,r0,sigma,n,delta,sigma1,sigma2,numbda);
    rT = mean(r(length(r))); % use as the initial value for P(T,S)
    % 1) Use Bond price caculated similarly in part a:
    P2 = Gaussian_bond(T,k,r_mean,r0,sigma,n,delta,sigma1,sigma2,numbda);
    C2(1) = mean(exp(-sum(r)*delta).*max(P1/P2-K,0)); % P(T,S)=P(t,S)/P(t,T)
    % 2) Use Bond price from the formula:
    B = 1/k*(1-exp(-k.*T));
    A = exp((r_mean-sigma^2/2/k^2)*(B-T)-sigma^2/4/k*B.^2);
    P_0_T = A.*exp(-B*r0);
    B = 1/k*(1-exp(-k.*S));
    A = exp((r_mean-sigma^2/2/k^2)*(B-S)-sigma^2/4/k*B.^2);
    P_0_S = A.*exp(-B*r0);
    display('Part b: call price');
    display('Using bond price in part a');
    C2(1)
%     display('Using bond price by formula');
%     C2(2)
% part c:
    % bond price:
    T = 0.5;
    B = 1/k*(1-exp(-k.*T));
    A = exp((r_mean-sigma^2/2/k^2)*(B-T)-sigma^2/4/k*B.^2);
    P3 = A.*exp(-B*r0);
    % call price:
    K = 0.98; T = 0.25; S = 0.5;
    h_2 = sigma1^2*(S-T)^2*T+4*sigma2^2/numbda^3*(exp(-numbda*T/2)-exp(-numbda*S/2))^2*(exp(numbda*T)-1);
    d1 = (log(P_0_S/k/P_0_T)+1/2*h_2)/sqrt(h_2);
    d2 = d1-sqrt(h_2);
    C3 = P_0_S*NORM(d1)-K*P_0_T*NORM(d2);
    display('Part c: bond price and call price');
    P3
    C3
    display('Error of bond price');
    abs(P3-P1)
    display('Error of call price');
    abs(C3-C2(1))
   

