% Euler's scheme
clear all; close all; clc;
n = 10000; delta = 0.005;
% E(X(2)^(1/3)):
X1 = nthroot((genX(2,n,delta)),3);
E1 = mean(X1); V1 = var(X1);
% E(Y(3)):
Y2 = genY(3,n,delta);
E2 = mean(Y2); V2 = var(Y2);
% E(X(2)*Y(2)*1(X(2)>1)):
X3 = genX(2,n,delta); Y3 = genY(2,n,delta);
Z3 = X3.*Y3.*(X3>1);
E3 = mean(Z3); V3 = var(Z3);
% P(Y(2)>5):
Y4 = genY(2,n,delta);
Z4 = (Y4>5);
E4 = mean(Z4); V4 = var(Z4);
display('E1 to E4');
E1
E2
E3
E4