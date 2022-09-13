% Script castShadow
% Position a light source and a box in a room and determine the extent of
% the shadow cast by the box. Includes visuals.
% Enhanced by: Ryan Ellis

clearvars

% Set up the window
close all         % Close all previous figure windows
figure            % Start a new figure window
hold on           % Keep the same set of axes (multiple plots on same axes)
axis equal        % unit lengths on x- and y-axis are equal
axis([0 10 0 10]) % x-axis limits [0,10], y-axis limits [0,10]

% Top left corner of box, point T
xt=5;  yt=7;
plot(xt, yt, 'b.')           % Format: Blue circle
plot([xt xt], [0 yt], 'k:')  % Format: blacK dotted line
text(xt-0.6, yt+0.3, '  T')

%%% Do not change the code above %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Modify the code below %%%%%%%%%%

% Light source, point L
xL=(rand()*xt);  yL=rand()*(10-yt)+yt;
plot(xL, yL, 'r*')           % Format: Red asterisk
text(xL, yL, '  L')



% User-clicked point
title('Click on the dotted line below')
[~, yu]= ginput(1);
xu=xt; % ALIAS
plot(xt, yu, 'b+')          
text(xt-0.6, yu-0.3, '  U')
messageToShow= sprintf('Light source: (%.1f,%.1f)', xL, yL);
title(messageToShow)

% % Radial rays (UNCOMMENT FOR COOL)
% for theta=0:0.05:2*pi
%    plot([xL 20*cos(theta)],[yL 20*sin(theta)], '-','Color','yellow')
% end

% Draw a rectangle between the edge, T, and U
plot([xt 10],[yt yt], '-','LineWidth',2 ,'Color','#ff4000')   
plot([xt xt],[yt yu], '-','LineWidth',2 ,'Color','#ff4000')
plot([xt 10],[yu yu], '-','LineWidth',2 ,'Color','#ff4000')
plot([10 10],[yt yu], '-','LineWidth',2 ,'Color','#ff4000')

% % Adds bars to rectangle  (UNCOMMENT FOR COOL)
% for patternY = yu:0.1:yt
% plot([xt 10],[patternY patternY], '-','LineWidth',3 ,'Color','#ff9900')
% end
% for patternY = yu+0.1:0.2:yt
% plot([xt 10],[patternY-0.1 patternY+0.1], '-','Color','#ff4000')
% end


% Calculates position of shadow start
rayRise=yL-yu;
rayRun=xL-xu;
raySlope=rayRise/-rayRun;
xS=(yL/raySlope)+xL;
yS=yu-((10-xu)*raySlope);

% % Fills in shadow  (UNCOMMENT FOR COOL)
% for shadowY = 0:0.1:yu
%    plot([((10-shadowY/raySlope)-(10-xS)), 10],[shadowY, shadowY], '-','LineWidth',3, 'Color','#2e2e6b')
% end

% Draws line to shadow point
plot(xS, 0, 'y.')          
text(xS, 0.3, '  S', 'Color',"white")
plot([xL xS],[yL 0], 'r*:') 

% Draws shadow edge lines
plot([xS 10],[0 0], '-','LineWidth',3, 'Color','#00004d')
plot([10 10],[yS yu], '-','LineWidth',3,'Color','#00004d')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Do not change the code below %%%

hold off