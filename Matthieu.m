
L=10;
n=100;
lambda = 15;
solinit = bvpinit(linspace(0,pi,10),@mat4init,lambda);

sol = bvp4c('mat4ode','mat4bc',solinit);