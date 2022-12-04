function drawHTree(x,y,len,w,level)
% Draw recursively an H-tree centered at (x,y).
% Each of the three lines of the ’H’ has length len and width w.
% level is a non-negative integer indicating the level of the recursion.
hold on
if level==0
%%
else
    plot([x-(len/2) x+(len/2)], [y y], 'Color', 'c', 'Linewidth', w)
    plot([x+(len/2) x+(len/2)], [y-(len/2) y+(len/2)], 'Color', 'c', 'Linewidth', w)
    plot([x-(len/2) x-(len/2)], [y-(len/2) y+(len/2)], 'Color', 'c', 'Linewidth', w)
    
    level=level-1;
    len=len/2;
    w=w/2;

    drawHTree(x-(len),y-(len),len/2,w/2,level)
    drawHTree(x-(len),y+(len),len/2,w/2,level)
    drawHTree(x+(len),y-(len),len/2,w/2,level)
    drawHTree(x+(len),y+(len),len/2,w/2,level)
    

end
hold off
end