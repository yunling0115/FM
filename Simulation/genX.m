function X = genX(t,n,delta) % generate a row vector X(t) with length n
% dX(t)=(1/5-1/2*X(t))*dt+2/3*dW(t),X(0)=1
m = t/delta+1; 
x = zeros(m,n); 
x(1,:) = 1; 
w = randn(m,n);
% Using Euler's scheme
for i = 1:m-1
    x(i+1,:) = x(i,:)+delta.*(1/5.-1/2.*x(i,:))+2/3.*sqrt(delta).*w(i,:);
end
X = x(m,:);
