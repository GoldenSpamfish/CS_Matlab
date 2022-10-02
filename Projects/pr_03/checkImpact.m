function [vx1,vy1,vx2,vy2] = checkImpact(x1,y1,vx1,vy1,x2,y2,vx2,vy2,r)
% Check for collision between two molecules and update their velocities
% as appropriate. If there is no collision the velocities do not change.
% Parameters: at current time, i.e., BEFORE checking for collision
% x1,y1 are scalars representing the position of molecule 1.
% vx1,vy1 are scalars representing the x- and y-velocities of molecule 1.
% x2,y2 are scalars representing the position of molecule 2.
% vx2,vy2 are scalars representing the x- and y-velocities of molecule 2.
% r is a scalar representing the radius of each molecule.
% Return parameters: AFTER checking for and possibly handling a collision
% vx1,vy1 are scalars representing the x- and y-velocities of molecule 1.
% vx2,vy2 are scalars representing the x- and y-velocities of molecule 2.
if sqrt((x1-x2)^2+(y1-y2)^2)<2*r
    dx=x2-x1;
    dy=y2-y1;
    
    vx1in=vx1;
    vx2in=vx2;
    vy1in=vy1;
    vy2in=vy2;
    
    vx1=(1/(dx^2+dy^2))*(vx2in*dx^2+vy2in*dx*dy+vx1in*dy^2-vy1in*dx*dy);
    vx2=(1/(dx^2+dy^2))*(vx2in*dx*dy+vy2in*dy^2-vx1in*dx*dy+vy1in*dy^2);
    vy1=(1/(dx^2+dy^2))*(vx1in*dx^2+vy1in*dx*dy+vx2in*dy^2-vy2in*dx*dy);
    vy2=(1/(dx^2+dy^2))*(vx1in*dx*dy+vy1in*dy^2-vx2in*dx*dy+vy2in*dx^2);
 
end
