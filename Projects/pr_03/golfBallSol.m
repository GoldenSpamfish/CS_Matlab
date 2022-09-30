% Script golfBallSol
% Simulate the trajectory of a golf ball.  Units are meters and seconds.
% The initial launch angle phi should be >0 and <=pi/2.
% Set up figure window
close all         % Close all previous figure windows
figure            % Start a new figure window
hold on           % Keep the same set of axes (multiple plots on same axes)
axis equal        % unit lengths on x- and y-axis are equal
axis([0 120 0 100])  % x-axis limits [0,120], y-axis limits [0,100]
xlabel('Distance along the ground (m)')
ylabel('Height (m)')
title('Trajectory of a golf ball')
% Constant
g= 9.81;  % Gravitational constant
%%% Do not change the code above %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modify the code below %%%%%%%%%%
% Parameters and Initial conditions
% DO NOT CHANGE these five variable NAMES, but you can experiment with
% different values.
k= 0.02;       % friction coefficient, 0<=k<1
dt= 0.01;      % size of time step
maxTime= 10;   % maximum duration of simulation
phi= pi/4;     % launch angle in radians, >0 and <=pi/2
v= 100;        % launch velocity
% Initial values for simulation
vx= v*cos(phi);
vy= v*sin(phi);
x= 0;
y= 0;
t= 0;
plot(x,y,'bo')
% Simulate trajectory until golf ball lands
ynew= 1;             % initialzed to enter loop
check4MaxHeight= 1;  % check for maximum height obtained 
while ynew>0 && t<maxTime
    rootTerm= sqrt(vx^2 + vy^2);
    vxnew= vx - dt*k*vx*rootTerm;
    vynew= vy - dt*(k*vy*rootTerm + g);
    xnew= x + vx*dt;
    ynew= y + vy*dt;
    t= t+dt;
    plot(xnew,ynew,'bo')
    pause(.01)
    % Check for max height
    if check4MaxHeight && ynew<y
        ascendTime= t;
        check4MaxHeight= 0;
    end 
    % Updates
    vx= vxnew;
    vy= vynew;
    x= xnew;
    y= ynew;
end
% Store final values
if check4MaxHeight  % maxTime is so short that the max possible height
                    % was not reached before simulation stopped
    ascendTime= t;
end
descendTime= t - ascendTime;
%%%% Answers to questions asked in project %%%%
% 1. pi/6 results in longest range.
% 2. The flight time is longer when launch angle is bigger.
% 3. When k=0 the trajectory is a parabola.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do not modify the code below %%%
hold off
fprintf('Horizontal distance traveled is %.2fm\n',x)
fprintf('Time of simulated trajectory is %.2fs ', t)
fprintf('(%.2fs ascending, %.2fs descending)\n', ascendTime,descendTime)
fprintf('Last computed y value (height from ground) is %.2fm\n\n', y)
    