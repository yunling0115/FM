function r = int(Exp_T,delta,m,initial_f,sigma_est) % return r(0) to r(Exp_T) column, m times
L = 0.2;
n = Exp_T/delta+1; % equal to length(inital_f)
R = zeros(n,m);
R(1,:) = initial_f(1);
homo_sig = sig(Exp_T,delta,sigma_est);
% i~T,j~t
for i = 2:n
    % Generate R(i)=r((i-1)*delta)=f((i-1)*delta) m times
    F = zeros(i,m);
    F(1,:)=min(initial_f(i),L); % f(0,(i-1)*delta) truncated
    for j = 2:i
        Z = randn(3,1);
        sig_star = homo_sig(:,1:(i-j+1))*min(F(j-1,j:i), L)'*delta;
        % sig_star = integrate(sig(s-t)*f(t,s),ds,t,T): f(t,t) = F(j,j),
        % f(t,T) = F(j,i)
        F(j,:) = min(L, F(j-1,:) + F(j-1,:)*sqrt(delta)*(homo_sig(:,i-j+1)'*Z) + sig_star'*homo_sig(:,i-j+1)*delta);
        % T-t = (i-1)*delta-(j-1)*delta = (i-j)*delta = ((i-j+1)-1)*delta
    end
    R(i,:) = F(i,:);
end
r = R;
    

