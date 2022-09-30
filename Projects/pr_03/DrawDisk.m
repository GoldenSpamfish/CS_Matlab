function DrawDisk(xc,yc,r,c)
% Adds a circular disk to the current window.
% Assumes hold is on.
% The disk has radius r, center(xc,yc) and
% color c where c is one of 'r', 'g', 'y', etc.

theta = linspace(0,2*pi);
cosVals = cos(theta);
sinVals = sin(theta);
fill(xc+r*cosVals,yc+r*sinVals,c);

  