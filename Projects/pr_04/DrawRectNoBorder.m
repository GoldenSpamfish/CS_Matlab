function DrawRectNoBorder(a,b,L,W,c)
% Adds a rectangle to the current window.
% Assumes hold is on.
% The rectangle has vertices (a,b), (a+L,b), (a+L,b+W), and (a,b+W)

x = [a a+L a+L a a];
y = [b b b+W b+W b];
fill(x,y,c, 'LineStyle','none');