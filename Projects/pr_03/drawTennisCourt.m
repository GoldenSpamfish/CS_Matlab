function drawTennisCourt(a,b)
%Draws a tennis court as specified in the txb p5.3.7 where the bottom left
%corner is at (a,b)

%draws white background
DrawRectNoBorder(0+a,0+b,79.25,35,"w")
%Draws the top and bottom two rectangles
DrawRectNoBorder(.25+a,.25+b,39.25,4.5, [41/256, 82/256, 39/256])
DrawRectNoBorder(39.75+a,.25+b,39.25,4.5, [41/256, 82/256, 39/256])
DrawRectNoBorder(39.75+a,30.25+b,39.25,4.5, [41/256, 82/256, 39/256])
DrawRectNoBorder(.25+a,30.25+b,39.25,4.5, [41/256, 82/256, 39/256])
%draws big two rectangles on the sides
DrawRectNoBorder(.25+a,5+b,18,25, [41/256, 82/256, 39/256])
DrawRectNoBorder(61+a,5+b,18,25, [41/256, 82/256, 39/256])
%draws middle four rectangles
DrawRectNoBorder(18.5+a,5+b,21,12.375, [41/256, 82/256, 39/256])
DrawRectNoBorder(39.75+a,17.375+b,21,12.625, [41/256, 82/256, 39/256])
DrawRectNoBorder(18.5+a,17.375+b,21,12.625, [41/256, 82/256, 39/256])
DrawRectNoBorder(39.75+a,5+b,21,12.375, [41/256, 82/256, 39/256])