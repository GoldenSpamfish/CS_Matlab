function outM = oneSweep(inM)
% One step of Conway’s Game of Life.
% inM and outM are 0-1 matrices of the same size. 1 is live; 0 is dead.
% inM is the initial state; outM is the state after 1 step of the game.
% Every "cell" in the matrix interacts with its immediate neighbors, which
% are the cells that are horizontally, vertically, or diagonally adjacent.
% At this time step, the following transitions occur:
% A live cell with fewer than 2 live neighbors dies (under-population).
% A live cell with 2 or 3 live neighbors lives on.
% A live cell with more than 3 live neighbors dies (overcrowding).
% A dead cell with exactly 3 live neighbors becomes live (reproduction).

xPos=[-1,0,1,-1,1,-1, 0,1];
yPos=[ 1,1,1, 0,0,-1,-1,-1];
[xSize,ySize]=size(inM);
outM=zeros(xSize,ySize);
for x=1:xSize
    for y=1:ySize
        total=0;
        for pos=1:length(xPos)
                 try  
                    total=total+inM(x+xPos(pos),y+yPos(pos));
                 catch
                    %disp('dominic pls')
                 end
        end

        if inM(x,y)==1
            if total<2
                 outM(x,y)=0;
             elseif total==2 || total == 3
                 outM(x,y)=1;
            else
                 outM(x,y)=0;
             end
        else
            if total==3
                 outM(x,y)=1;
            end
        end
      
    end
end


