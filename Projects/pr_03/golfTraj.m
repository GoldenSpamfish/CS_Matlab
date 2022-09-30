function [Xvec,Yvec] = golfTraj(dt,x0,y0,v0,phi,k)
%Trajectory of golf ball
Xvec=[];
Yvec=[];
g= 9.81;  % Gravitational constant
%%% Do not change the code above %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modify the code below %%%%%%%%%%
% Parameters and Initial conditions
% DO NOT CHANGE these five variable NAMES, but you can experiment with
% different values.
v=v0;
vx= v*cos(phi);
vy= v*sin(phi);
x= x0;
y= y0;
t= 0;
% Simulate trajectory until golf ball lands
ynew= 1;             % initialzed to enter loop
while ynew>0
    rootTerm= sqrt(vx^2 + vy^2);
    vxnew= vx - dt*k*vx*rootTerm;
    vynew= vy - dt*(k*vy*rootTerm + g);
    xnew= x + vx*dt;
    ynew= y + vy*dt;
    t= t+dt;
    Xvec=[Xvec xnew];
    Yvec=[Yvec ynew];
    % Updates
    vx= vxnew;
    vy= vynew;
    x= xnew;
    y= ynew;
end
Yvec(length(Yvec))=0;
end