close all
figure
axis equal off
hold on
%sets parameters
courtwidth=119.25;
courtheight=75;
%makes a three by four grid of tennis courts
for x=0:courtwidth:courtwidth*3
    for y=0:courtheight:courtheight*2
        drawTennisCourt(x,y)
    end
end

hold off
