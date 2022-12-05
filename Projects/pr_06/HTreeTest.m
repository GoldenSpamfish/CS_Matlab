close all
figure
x= 0;
y= 0;
len= 10;
width= 5; % corresponds to the "Linewidth" property in function plot
level= 4;
axis equal off
hold on
drawHTree(x,y,len,width,level)
hold off