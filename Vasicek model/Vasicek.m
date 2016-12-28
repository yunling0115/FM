function r = Vasicek(t,T,k,r_mean,r0,sigma,n,delta) 
% generate n column vecotrs r's with delta.
% Note: can only calculate for t=0, else, using rt = r0
m = (T-t)/delta+1;
R = zeros(m,n);
R(1,:) = r0*ones(1,n);
for i = 1:m-1
    R(i+1,:) = R(i,:)+k*(r_mean-R(i,:))*delta+sigma*sqrt(delta)*randn(1,n);
end
r = R;