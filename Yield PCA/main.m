%% Ex1
clear all; close all; clc
load DATA.mat;
T = [3/12,6/12,1,2,3,4,5,7,10,15,20,30];
d = -diff(Daily_Yeild_Curve)/100;
Sigma = cov(d);
[V,D] = eig(Sigma);
k = length(Sigma);
Numbda(1) = D(k,k); Numbda(2) = D(k-1,k-1); Numbda(3) = D(k-2,k-2);
PC(1,:) = V(:,k); PC(2,:) = V(:,k-1); PC(3,:) = V(:,k-2);
figure(1);
plot(1:k,PC','-*');
axis tight;
figure(2);
plot(T,PC','-*');
set(gca,'XTick',T);
axis tight;
display('Sum of largest three eigenvalues/ Sum of all eigenvalues');
display('Or: Variance interpreted by the three largest engivalues');
sum(Numbda)/sum(diag(D))
PC

%% Ex2
clear all; close all; clc
load DATA.mat;
load Date.mat;
% Part a:
    T = [3/12,6/12,1,2,3,4,5,7,10,15,20,30];
    Delta = -diff(date)/365;
    [n,k] = size(Daily_Yeild_Curve);
    D = -diff(Daily_Yeild_Curve)./((sqrt(Delta)*ones(1,12)).*min(0.2*100,Daily_Yeild_Curve(2:n,:)));
    C = 1/(n-1)*D'*D;
    [V,D] = eig(C);
    k = length(C);
    Numbda(1) = D(1,1); Numbda(2) = D(2,2); Numbda(3) = D(3,3);
    display('Variance interpreted by the three largest engivalues using approximation of covariance matrix');
    sum(Numbda)/sum(diag(D))
    PC(1,:) = V(:,1); PC(2,:) = V(:,2); PC(3,:) = V(:,3);
    sigma_est = diag(sqrt(Numbda))*PC;
    figure(1);
    plot(1:k,PC','-*');
    axis tight;
    figure(2);
    plot(T,PC','-*');
    set(gca,'XTick',T);
    axis tight;
% Part b:
    m = 1000; Exp_T = 0.5; delta = 1/2^8;
    initial_f = forwardF(Exp_T,delta);
    r2 = int(Exp_T,delta,m,initial_f,sigma_est);
    P2 = mean(exp(-sum(r2)*delta));
    display('Bond Price');
    P2
% Part c:
    Exp_S = 0.5; Exp_T = 0.25; K = 0.96;
    P_T_S = mean(exp(-sum(r2(Exp_T/delta+2:Exp_S/delta+1,:))*delta));
    C3 = mean(exp(-sum(r2(Exp_T/delta+2,:))*delta)*max(P_T_S-K,0));
    display('Call Price');
    C3
