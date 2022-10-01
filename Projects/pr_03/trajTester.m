k= 0.02;       % friction coefficient, 0<=k<1
dt= .05;      % size of time step
% phi= pi/4;     % launch angle in radians, >0 and <=pi/2
v= 100;
x= 0;
y= 0;
for i=linspace(0,pi/2,5)
   [a,b]=golfTraj(dt,x,x,v,i,k);
   for j = 1:length(a)
       plot(a(j),b(j))
   end
end
