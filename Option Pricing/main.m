%% Ex1
clear all; close all; clc;
r = 0.05; sigma = 0.3; X = 100; T = 1;
S0 = 0:5:120;
n = 200;
delta = T/n;
% u = exp(sigma*sqrt(delta));
% d = exp(-sigma*sqrt(delta));
% p = 1/2+1/2*(r-sigma^2/2).*sqrt(delta)./sigma;
u = exp((r-sigma^2/2).*delta+sigma.*sqrt(delta));
d = exp((r-sigma^2/2).*delta-sigma.*sqrt(delta));
p = 1/2;
for i = 1:length(S0)
    AP(i) = AmericanPut(S0(i),T,X,r,sigma,delta,u,d,p);
    EP(i) = EuropeanPut(S0(i),T,X,r,sigma,delta,u,d,p);
end
display('European Put: blue / American Put: red');
plot(S0,AP,'r-'); hold on;
plot(S0,EP,'b'); hold off;

%% Ex2
clear all; close all; clc;
S0 = 49; K = 50; r = 0.03; sigma = 0.2; T = 0.3846; 
N = 1000; b1 = 2; b2 = 3;
% S0 = 32; K = 30; r = 0.05; sigma = 0.24; T = 0.5; 
% N = 500; b1 = 2; b2 = 3;
C = BS_N(S0,T,K,r,sigma)
PC = EuropeanCall(S0,K,T,r,sigma,N,b1,b2);
display('Price by MC');
PC
display('Price by BS');
C
