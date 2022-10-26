function multiSelect(A,n)
% Allow user to select multiple rectangular regions of an image to be
% displayed as pixelated
% A: RGB data of an image, a 3-d uint8 array.
% n: Block size, i.e., each block is n-by-n pixels (n rows by n cols).
%    n is a positive integer value.
%
% Repeatedly prompt the user to click two points on the displayed image to
% select a rectangular area to pixelate or to click outside the image to 
% stop.  After each selection of a rectangular area, call function pixelate
% to display the image with the selected area pixelated.   
% Use the figure title area to display instructions to the user throughout 
% code execution, ending with the message "Pixelating done!" when the user 
% clicks outside the image. 

% Display the image and instructions to user
close all
image(A)  % Call image instead of imshow for flexibiliy in sizing the title
daspect([1 1 1]) % Aspect ratio: equal data unit lengths in all directions
msg1= {'Click 2 points on the image to select an area to pixilate.'; ...
       'Click outside the image to stop'};
title(msg1) 
hold on
% Above, msg1 is a CELL ARRAY, created using { }. You will learn about cell
% arrays soon.  We use it here because the function title uses a cell array
% to make multi-line titles.

%%%% DO NOT MODIFY THE CODE ABOVE. %%%%
%%%% ADD YOUR CODE BELOW.          %%%%

% This function multiSelect deals with the user-clicked points.  Your code 
% here must call the seperate function pixelate to perform and show the
% pixelation each time the user selects a rectangular region.
[x1,y1]=ginput(1);
[x2,y2]=ginput(1);
if (x2<x1)
    var=x1;
    x1=x2;
    x2=var;
end
if (y2<y1)
    var=y1;
    y1=y2;
    y2=var;
end

pixelate(A,round(x1),round(x2),round(y1),round(y2),n)



%%%% ADD YOUR CODE ABOVE %%%%
hold off