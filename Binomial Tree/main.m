% Binomial Tree
%% Ex1
clear all; close all; clc;
r = 0.05; sigma = 0.24; S0 = 32; X = 30; T = 0.5;
n = [10,15,20,40,70,80,100,200,500];
C = BS_N(S0,T,X,r,sigma);
delta = T./n;
% [u c d]
% Part a:
    c = 1/2*(exp(-r*delta)+exp((r+sigma^2).*delta));
    d = c-sqrt(c.^2-1);
    u = 1./d;
    p = (exp(r*delta)-d)./(u-d);
    for i = 1:length(n)
        C_1(i) = BioTreeCall(S0,T,X,r,sigma,delta(i),u(i),d(i),p(i));
    end
    err1 = abs(C_1-C);
    figure(1);
    plot(n,zeros(length(n)),'-.r'); hold on;
    plot(n,C_1-C,'*-.'); hold off;
% Part b:
    u = exp(r*delta).*(1+sqrt(exp(sigma^2*delta)-1));
    d = exp(r*delta).*(1-sqrt(exp(sigma^2*delta)-1));
    p = 1/2;
    for i = 1:length(n)
        C_2(i) = BioTreeCall(S0,T,X,r,sigma,delta(i),u(i),d(i),p);
    end
    err2 = abs(C_2-C);
    figure(2);
    plot(n,zeros(length(n)),'-.r'); hold on;
    plot(n,C_2-C,'*-.'); hold off;
% Part c:
    u = exp((r-sigma^2/2)*delta+sigma*sqrt(delta));
    d = exp((r-sigma^2/2)*delta-sigma*sqrt(delta));
    p = 1/2;
    for i = 1:length(n)
        C_3(i) = BioTreeCall(S0,T,X,r,sigma,delta(i),u(i),d(i),p);
    end
    err3 = abs(C_3-C);
    figure(3);
    plot(n,zeros(length(n)),'-.r'); hold on;
    plot(n,C_3-C,'*-.'); hold off;
% Part d:
    u = exp(sigma*sqrt(delta));
    d = exp(-sigma*sqrt(delta));
    p = 1/2+1/2*(r-sigma^2/2).*sqrt(delta)./sigma;
    for i = 1:length(n)
        C_4(i) = BioTreeCall(S0,T,X,r,sigma,delta(i),u(i),d(i),p(i));
    end
    err4 = abs(C_4-C);
    figure(4);
    plot(n,zeros(length(n)),'-.r'); hold on;
    plot(n,C_4-C,'*-.'); hold off;
figure(5);
plot(n,zeros(length(n)),'-.k'); hold on;
plot(n,C_1-C); plot(n,C_2-C,'r'); plot(n,C_3-C,'g'); plot(n,C_4-C,'y');
hold off;

%% Ex2
S0 = 380; r = 0.02; X = 500; T = 198/365; sigma = sigma_month_est;
n = 500;
delta = T/n;
u = exp(sigma*sqrt(delta));
d = exp(-sigma*sqrt(delta));
C_GOOG = BioTreeCall(S0,T,X,r,sigma,delta,u,d);
C_BS_GOOG = BS_N(S0,T,X,r,sigma);
display('Jan 2010 Call GOOG by bionomial tree');
C_GOOG
display('Jan 2010 Call GOOG by BS');
C_BS_GOOG

%% Ex3
clear all; close all; clc;
S0 = 50; X = 50; r = 0.03; sigma = 0.2; T = 0.3846; mu = 0.14;
% Part (i):
    clear S0; S0 = 10:2:80;
    for i = 1:length(S0)
        d1 = (log(S0(i)/X)+(r+sigma^2/2)*T)/(sigma*sqrt(T));
        d2 = d1-sigma*sqrt(T);
        Delta(i) = NORM(d1);
    end
    figure('Name','Delta-S0');
    plot(S0,Delta);
% Part (ii):
    clear S0; S0 = 49;
    clear T; T = 0:0.0002:0.3846;
    clear d1 d2;
    for i = 1:length(T)
        d1 = (log(S0/X)+(r+sigma^2/2)*T(i))/(sigma*sqrt(T(i)));
        d2 = d1-sigma*sqrt(T(i));
        Delta(i) = NORM(d1);
    end
    figure('Name','Delta-T');
    plot(T,Delta);
% Part (iii)-(vi):
    clear S0; S0 = 10:2:80;
    clear T; T = 0.3846;
    clear d1 d2;
    for i = 1:length(S0)
        d1 = (log(S0(i)/X)+(r+sigma^2/2)*T)/(sigma*sqrt(T));
        d2 = d1-sigma*sqrt(T);
        Theta(i) = -S0(i)*densityN(d1)*sigma/(2*sqrt(T))-r*X*exp(-r*T)*NORM(d2);
        Gamma(i) = densityN(d1)/(S0(i)*sigma*sqrt(T));
        Vega(i) = S0(i)*densityN(d1)*sqrt(T);
        Rol(i) = X*T*exp(-r*T)*NORM(d2);
    end
    figure('Name','Theta-S0');
    plot(S0,Theta);
    figure('Name','Gamma-S0');
    plot(S0,Gamma);
    figure('Name','Vega-S0');
    plot(S0,Vega);
    figure('Name','Rol-S0');
    plot(S0,Rol);