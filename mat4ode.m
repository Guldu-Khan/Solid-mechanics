function dydx = mat4ode(x,y,lambda,L)
Mo=10;
P=5;
dydx = [ y(2); ((lambda^2)*2)*(1-round(x/L))- lambda^2*y(1)];