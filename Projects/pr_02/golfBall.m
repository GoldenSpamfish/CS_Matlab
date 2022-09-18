% Script golfBall
% Simulate the trajectory of a golf ball.  Units are meters and seconds.
% The initial launch angle phi should be >0 and <=pi/2.
% Edited by: Hannah Ciesler / Ryan Ellis

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
maxTime= 10;   % maximum duration of simulation allowed
phi= pi/4;     % launch angle, >0 and <=pi/2
v= 100;        % launch velocity

 
% initialization
x= 0;
y= 0;
ascendTime= -1;
vx=v*cos(phi);
vy=v*sin(phi);
t=0;
ymax=-1;

% loop control, ends at maxtime or y<0
while (t<maxTime && y>=0)
    % enumeration
    t=t+dt;

    % math for position
    vx=vx-dt*k*vx*sqrt(vx^2+vy^2);
    vy=vy-dt*(k*vy*sqrt(vx^2+vy^2)+g);
    x=x+vx*dt;
    y=y+vy*dt;
    
    plot(x,y,"ro")

    % finds ascend time with repeated assignment
    if (y>ymax)
    ymax=y;
    ascendTime=t;
    end


end

% descend time calculation
descendTime=t-ascendTime;

%%%%%%%%%%%%% ANSWERS %%%%%%%%%%%%%%%%%%%
% 1) pi/6
% 2) as launch decreases, time increases
% 3) parabolic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do not modify the code below %%%

hold off

fprintf('Horizontal distance traveled is %.2fm\n',x)
fprintf('Time of simulated trajectory is %.2fs ', t)
fprintf('(%.2fs ascending, %.2fs descending)\n', ascendTime,descendTime)
fprintf('Last computed y value (height from ground) is %.2fm\n\n', y)
    
    
