function f = forwardF(Exp_T,delta)
t = 0:delta:Exp_T;
f = -11/640*exp(-1/5.*t)+151/3200+9/16000*(5-5*exp(-1/5.*t)).*exp(-1/5.*t);