function r = Gaussian(T,k,r_mean,r0,sigma,n,delta,sigma1,sigma2,numbda)
% Note: k,r_mean,sigma are just the parameters to generate initial forward
% yield curve, not the parameter of model itself.
% generate n column vecotrs r's with delta.
% Note: can only calculate for t=0, else, using rt = r0
f = forwardF(T,delta);
R = zeros(length(f),n);
for i = 1:length(f)
        R(i,:) = f(i)+sigma1^2*(i*delta)^2/2-2*(sigma/numbda)^2*(1-exp(-numbda*(i*delta))-2*(1-exp(-numbda*(i*delta)/2)))+sigma1*sqrt(i*delta)*randn(1,n);
end
r = R;