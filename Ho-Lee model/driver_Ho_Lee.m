clear all; close all; clc
n = 1000; delta = 0.5/182;
r0 = 0.03; sigma = 0.015; k = 0.2; r_mean = 0.05;
% Part a:
    T = 0.5;
    P1 = Ho_Lee_bond(T,k,r_mean,r0,sigma,n,delta);
    display('Part a: bond price');
    P1
% Part b:
    K = 0.98; T = 0.25; S = 0.5;
    r = Ho_Lee(T,k,r_mean,r0,sigma,n,delta);
    rT = mean(r(length(r))); % use as the initial value for P(T,S)
    % 1) Use Bond price caculated similarly in part a:
    P2 = Ho_Lee_bond(T,k,r_mean,r0,sigma,n,delta);
    C2(1) = mean(exp(-sum(r)*delta).*max(P1/P2-K,0)); % P(T,S)=P(t,S)/P(t,T)
    % 2) Use Bond price from the formula:
    B = 1/k*(1-exp(-k.*T));
    A = exp((r_mean-sigma^2/2/k^2)*(B-T)-sigma^2/4/k*B.^2);
    P_0_T = A.*exp(-B*r0);
    B = 1/k*(1-exp(-k.*S));
    A = exp((r_mean-sigma^2/2/k^2)*(B-S)-sigma^2/4/k*B.^2);
    P_0_S = A.*exp(-B*r0);
    f = forward(T,delta,r0,sigma,k,r_mean);
    fT = f(length(f));
    P_T_S = P_0_S/P_0_T*exp((S-T)*fT-sigma^2/2*T*(S-T)^2-(S-T)*rT);
    C2(2) = mean(exp(-sum(r)*delta).*max(P_T_S-K,0));
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
    sigma_p = sigma*(S-T)*sqrt(T);
    d1 = 1/sigma_p*log(P_0_S/P_0_T/K)+1/2*sigma_p;
    d2 = d1-sigma_p;
    C3 = P_0_S*NORM(d1)-P_0_T*K*NORM(d2);
    display('Part c: bond price and call price');
    P3
    C3
    display('Error of bond price');
    abs(P1-P3)
    display('Error of call price');
    abs(C2(1)-C3)

    