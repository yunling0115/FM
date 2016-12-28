function C = BS_MCAV(S0,T,X,r,rol)
n = 100000;
W = sqrt(T)*randn(n,1);
S_pos = S0*exp(rol.*W+(r-rol^2/2)*T.*ones(n,1));
S_neg = S0*exp(rol.*(-W)+(r-rol^2/2)*T.*ones(n,1));
X_MCAV = exp(-r*T)*((max(zeros,S_pos-X))+(max(zeros,S_neg-X)))/2;
C = mean(X_MCAV);
