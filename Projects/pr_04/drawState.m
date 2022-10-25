function drawState(m, s)
% m is a 0-1 matrix. s is the step number in the game.
% Draw an asterisk at (c,-r) if m(r,c) is 1 (live).
% Draw a dot at (c,-r) if m(r,c) is 0 (dead).
% Display the step number in the title area of the figure.
for i = 1:s   
    m=oneSweep(m);
end
[rSize,cSize]=size(m);
cla
hold on
xlim([-(rSize+1) 0])
ylim([0 cSize+1])
for c=1:cSize
    for r=1:rSize
        num = m(r,c);
        if num ==1
            plot(-r,c,-r,c,"b.")
        else
            plot(-r,c,-r,c,"r*")
        end
    end
end
title(['Step: ' num2str(s)])
hold off
