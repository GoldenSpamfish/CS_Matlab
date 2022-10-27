function m = gameOfLife(m, n)
% Simulate n steps of the Game of Life.
% Pre: m is a 0-1 matrix representing the initial state. m is not empty.
% Post: m is a 0-1 matrix representing the state after n steps of the game.
close all
figure
axis equal off
drawState(m,1)
drawnow

% Simulate n steps
for k= 1:n
pause(0.1) 
drawState(m,k)

drawnow % Force MATLAB to complete drawing in the figure window before
% moving on. Useful in animation (in loop) when the computation
% gets done faster than drawing on the screen.
% Write your code to simulate one step and draw the state
end