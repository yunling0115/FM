function Y = genY(t,n,delta) % generate a row vector Y(t) with length n
% dY(t)=(2/(1+t)*Y(t)+(1+t^3)/3)*dt+(1+t^3)/3*dZ(t),X(0)=3/4
m = t/delta+1; 
y = zeros(m,n); 
y(1,:) = 3/4; 
w = randn(m,n);
% Using Euler's scheme
for i = 1:m-1
    y(i+1,:) = y(i,:)+(2/(1+i*delta)*y(i,:)+(1+(i*delta)^3)/3)*delta+(1+(i*delta)^3)/3*sqrt(delta)*w(i,:);
end
Y = y(m,:);
