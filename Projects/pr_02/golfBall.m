% Script golfBall
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
maxTime= 10;   % maximum duration of simulation allowed
phi= pi/4;     % launch angle, >0 and <=pi/2
v= 100;        % launch velocity



% Dummy values set so that the script completes execution.  Remove the 
% dummy values as you complete the code to calculate their actual values. 
x= -1;
y= -1;
t= -1;
ascendTime= -1;
descendTime= -1;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do not modify the code below %%%

hold off

fprintf('Horizontal distance traveled is %.2fm\n',x)
fprintf('Time of simulated trajectory is %.2fs ', t)
fprintf('(%.2fs ascending, %.2fs descending)\n', ascendTime,descendTime)
fprintf('Last computed y value (height from ground) is %.2fm\n\n', y)
    
    
