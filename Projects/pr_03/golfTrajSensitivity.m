close all % Close all figure windows
figure % Start a new figure
set(gcf,'Units','normalized','Position',[.3 .2 .5 .6])
subplot(2,1,1) % First subplot in this figure window
hold all % See Note 1 below
xlabel("X position (m)")
ylabel("Y position (m)")
title("Sensitivity to launch angle phi")
k= 0.02;       % friction coefficient, 0<=k<1
dt= .05;      % size of time step
v= 100;
x= 0;
y= 0;
legendtext={};
phiVec=linspace(0.1,pi/2,5);

for i=1:length(phiVec)
legendText{i} = sprintf('phi=%.2f', phiVec(i)); %#ok<SAGROW> % % See Note 3 below

%plots each line for phi sensitivity
[a,b]=golfTraj(dt,x,y,v,phiVec(i),k);
plot(a,b,"-o")   

end 
legend(legendText) % Make a legend using the text in legendText


% Add a title and labels for the x and y axes
hold off % Needed before you do the next sensitivity analysis on k

subplot(2,1,2)
hold on

xlabel("X position (m)")
ylabel("Y position (m)")
title("Sensitivity to Friction Coef k")

dt= .05;      % size of time step
phi=pi/4;
v= 100;
x= 0;
y= 0;
legendtext={};
kVec=linspace(0.01,.2,5);

for i=1:length(kVec)
legendText{i} = sprintf('k=%.2f', kVec(i)); %#ok<SAGROW> % % See Note 3 below

%plots each line for k sensitivity
[a,b]=golfTraj(dt,x,y,v,phi,kVec(i));
plot(a,b,"-o")
end 
legend(legendText) % Make a legend using the text in legendText


hold off