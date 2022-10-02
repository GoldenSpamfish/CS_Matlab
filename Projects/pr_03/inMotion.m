% Simulate the motion of molecules in a 2-d space with width w and height h
% over T time steps. All molecules have radius r.
% x and y are vectors where (x(k),y(k)) is the position of the kth particle.
% vx and vy are vectors:
% vx(k) is the x-velocity of the kth particle.
% vy(k) is the y-velocity of the kth particle.
% Return parameters:
% xFinal and yFinal store the positions of the molecules after T time steps:
% (xFinal(k),yFinal(k)) is the final position of the kth particle.
function [xFinal, yFinal] = inMotion(x,y,vx,vy,r,w,h,T)
recentCollisions=zeros(length(x),length(y));

for t=1:T
    drawMolecules(x,y,r,w,h)

    for a = 1:length(x)
        for b = a+1:length(x)
            
%               SPECIAL BINDING PREVENTION            
            pre=[vx(a),vy(a),vx(b),vy(b)];
            [vx1,vy1,vx2,vy2]=checkImpact(x(a),y(a),vx(a),vy(a),x(b),y(b),vx(b),vy(b),r);
            post=[vx1,vy1,vx2,vy2];
            
            if ~isequal(pre,post) && (recentCollisions(a,b)<=0)
                vx(a)=vx1;
                vy(a)=vy1;
                vx(b)=vx2;
                vy(b)=vy2;
                recentCollisions(a,b)=recentCollisions(a,b)+1;
                
            elseif recentCollisions(a,b)>0
                clippingCycles=length(x);
                recentCollisions(a,b)=recentCollisions(a,b)-(1/clippingCycles);
            end

%             % DEFAULT
%             [vx(a),vy(a),vx(b),vy(b)]=checkImpact(x(a),y(a),vx(a),vy(a),x(b),y(b),vx(b),vy(b),r);

        end
    end

    for k=1:length(x)
    % WALL COLLISIONS
    if((x(k)-r)<0 || x(k)+r>w)
         vx(k)=-vx(k);
         if x(k)-r<0
          x(k)=0+r;
         else 
            x(k)=w-r;
         end
    end
    if(y(k)-r<0 || y(k)+r>h)
         vy(k)=-vy(k);
         if y(k)-r<0
          y(k)=0+r;
         else 
            y(k)=h-r;
         end
    end

    % POSITION SETTING
    x(k)=x(k)+vx(k);
    y(k)=y(k)+vy(k);

    xFinal(k)=x(k);
    yFinal(k)=y(k);
    end
    pause(0.01)
end
