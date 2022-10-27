function drawState(m, s)
% m is a 0-1 matrix. s is the step number in the game.
% Draw an asterisk at (c,-r) if m(r,c) is 1 (live).
% Draw a dot at (c,-r) if m(r,c) is 0 (dead).
% Display the step number in the title area of the figure.

% resimulates all previous steps to find state at current step
for i = 1:s   
    m=oneSweep(m);
end

% finds board size
[rSize,cSize]=size(m);

cla
hold on
% sets axes
xlim([-(rSize+1) 0])
ylim([0 cSize+1])

% traverses array and draws dots based on value
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

% sets title to current step
title(['Step: ' num2str(s)])
hold off
