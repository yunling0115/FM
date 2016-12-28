function C = BS_N(S0,T,X,r,rol)
d1 = (log(S0/X)+(r+rol^2/2)*T)/(rol*sqrt(T));
d2 = d1-rol*sqrt(T);
C = S0*NORM(d1)-X*exp(-r*T)*NORM(d2);
% C = S0*normcdf(d1,0,1)-X*exp(-r*T)*normcdf(d2,0,1);