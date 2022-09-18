%Illusion
% Hannah Ceisler / Ryan Ellis
%
% Plots a Scintillating grid
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clearvars

n = input("width of frame in squares: \n");
dotrad= 1/12;

% Set up the window
close all         % Close all previous figure windows
figure            % Start a new figure window
hold on           % Keep the same set of axes (multiple plots on same axes)
axis equal off       % unit lengths on x- and y-axis are equal

% Background
DrawRect(0,0,n,n,"k")

% Bars
for x=1:n-1
    DrawRect(x-dotrad,0,2*dotrad,n, "r")
end
for y=1:n-1
    DrawRect(0,y-dotrad,n,2*dotrad, "r")
end

% Dots
for x=1:n-1
    for y=1:n-1
       DrawDisk(x,y,dotrad,"w")
    end
end

hold off
      

