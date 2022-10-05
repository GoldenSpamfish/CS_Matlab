%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% drawMolecules
% Hannah Ceisler / Ryan Ellis
%
% Pure Visual element of particle sim
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function  drawMolecules(x,y,r,w,h)
% % Draw all molecules with axis limits w (x direction) and h (y direction).
% x, y are vectors of the same length: (x(k),y(k)) is the position of the kth molecule.
% All molecules have radius r.
% Assume r<w/2, r<h/2, and all the molecules lie completely inside the borders.
% The first molecule is magenta; all other molecules are blue.

 cla % Clear axes (i.e., remove all drawn objects)
axis equal manual % Axes have equal scaling and are frozen at current scale
axis([0 w 0 h]) % Set axes limits: x-axis ranges from 0 to w; y-axis ranges from 0 to h
set(gca, 'xtick', []) % No x-axis tickmarks
set(gca, 'ytick', []) % No y-axis tickmarks
box on % Draw border
hold on % Subsequent plot/fill commands appear on current axes

%Drawing Molecules

% color of first
DrawDiskNoLine (x(1), y(1), r, 'm')

% color of all additional particles
for i = 2:length(x)
    DrawDiskNoLine(x(i),y(i),r,'b')
end

hold off
end
