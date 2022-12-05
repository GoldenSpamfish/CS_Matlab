function drawHTree(x,y,len,w,level)
% Draw recursively an H-tree centered at (x,y).
% Each of the three lines of the ’H’ has length len and width w.
% level is a non-negative integer indicating the level of the recursion.
hold on                 %this and the hold off are not needed if the user enters it prior to calling the function. If the user does add it, it has no affect on the function
if level==0
%%
else
    charA = 'krymg';            %char array of non-blue color possibilties
    num = ceil(rand*10);        %generates number from one to ten randomly
    if num == 5                 %one number out of ten = 1/10 chance. The number doesn't have to be five but that's what we picked.       
        num2 = ceil(rand*5);    %if the random number selected is 5 then picks another ransom number from 1 to 5
        i = charA(num2);        %sets the new color to the random number from 1-5 element in the char array (basically it randomly selects a new color out of the five)
    else
        i = 'b';                %otherwise, the color stays blue

    end

    plot([x-(len/2) x+(len/2)], [y y], 'Color', i, 'Linewidth', w)                  %Plots the middle horizontal line of the H
    plot([x+(len/2) x+(len/2)], [y-(len/2) y+(len/2)], 'Color', i, 'Linewidth', w)  %Plots the right hand vertical line of the H
    plot([x-(len/2) x-(len/2)], [y-(len/2) y+(len/2)], 'Color', i, 'Linewidth', w)  %Plots the left hand vertical line of the H
    
    level=level-1;                      %subtracts one from level, which allows the function to track what iteration it is on, and hence is able to stop itself when level becomes 0.
    len=len/2;                          %halves length and width (this makes it easier to write lines 27-30)
    w=w/2;

    drawHTree(x-(len),y-(len),len,w,level)          %calls the function again recursively to draw another H at each endpoint of the previous H
    drawHTree(x-(len),y+(len),len,w,level)
    drawHTree(x+(len),y-(len),len,w,level)
    drawHTree(x+(len),y+(len),len,w,level)
    

end
hold off
end