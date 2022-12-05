function drawHTree(x,y,len,w,level)
% Draw recursively an H-tree centered at (x,y).
% Each of the three lines of the ’H’ has length len and width w.
% level is a non-negative integer indicating the level of the recursion.
hold on
if level==0
%%
else
    charA = 'krymg';
    num = ceil(rand*10);
    if num == 5
        num2 = ceil(rand*5);
        i = charA(num2);
    else
        i = 'b';

    end

    plot([x-(len/2) x+(len/2)], [y y], 'Color', i, 'Linewidth', w)
    plot([x+(len/2) x+(len/2)], [y-(len/2) y+(len/2)], 'Color', i, 'Linewidth', w)
    plot([x-(len/2) x-(len/2)], [y-(len/2) y+(len/2)], 'Color', i, 'Linewidth', w)
    
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