k= 0.02;       % friction coefficient, 0<=k<1
dt= .1;      % size of time step
phi= pi/4;     % launch angle in radians, >0 and <=pi/2
v= 100;
x= 0;
y= 0;
[a,b]=golfTraj(dt,x,x,v,phi,k);
disp(a)
disp(b)