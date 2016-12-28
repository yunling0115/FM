function r = Ho_Lee(T,k,r_mean,r0,sigma,n,delta) 
% Note: k,r_mean,sigma are the parameters to generate initial forward yeild
% curve, but among them only sigma is also the parameter for the model itself.
% generate n column vecotrs r's with delta.
% Note: can only calculate for t=0, else, using rt = r0
f = forwardF(T,delta);
R = zeros(length(f),n);
for i = 1:length(f)
        R(i,:) = f(i)+sigma^2*(delta*i)^2/2+sigma^2*sqrt(delta*i)*randn(1,n);
end
r = R;
