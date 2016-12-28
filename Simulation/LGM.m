% Generator of n Uniform Distr on [0,1] by LGM
function y = LGM(n)
% Parameters:
a = 7^5;
b = 0;
m = 2^31-1;
% Generate:
x0 = 101; % can change to cputime
x(1) = mod(a*x0-b,m);
y(1) = (x(1)+1/2)/m;
for i = 1:n-1
    x(i+1) = mod(a*x(i)-b,m);
    y(i+1) = (x(i+1)+1/2)/m;
end


