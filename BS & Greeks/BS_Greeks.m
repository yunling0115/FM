% BS & Greeks
%% BS
clear all; close all; clc
S0=20; X=20; sigma=0.25; r=0.04; T=0.5; n=10000;
W = sqrt(T)*randn(n,1);
S = S0*exp(sigma.*W+(r-sigma^2/2)*T.*ones(n,1));
I = sum(S<X);
P = I/n;
display('Prob'); P
%% Greeks
clear all; close all; clc
S0 = 10:0.01:40;
X = 20; sigma = 0.25; r = 0.04; T = 0.5;
% G = [delta,gamma,rol,theta,vega]
for i = 1:length(S0)
    G(i,:) = Greeks(S0(i),T,X,r,sigma);
end
figure('name','d(C)/d(S)');
plot(S0,G(:,1));
figure('name','d(C)^2/d^2(S)');
plot(S0,G(:,2));
figure('name','d(C)/d(r)');
plot(S0,G(:,3));
figure('name','d(C)/d(t)');
plot(S0,G(:,4));
figure('name','d(C)/d(sigma)');
plot(S0,G(:,5));