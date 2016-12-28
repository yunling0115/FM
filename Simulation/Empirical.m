% Empirical function
function p = Empirical(y,x)
n = 0;
for i = 1:length(y)
    if (y(i)<x)||(y(i)==x)
        n = n+1;
    end
end
p = n/length(y);
    