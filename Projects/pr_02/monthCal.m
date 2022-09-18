%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% monthCal
% Hannah Ciesler / Ryan Ellis
%
% Prints out a month's calendar
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% inputs
days = input("Enter how many days in the month: ");
dayofweek = input("Starting day-of-the-week (1=Mon, 7=Sun): ");

% prints header
fprintf(" Su Mo Tu We Th Fr Sa\n")

% adds leading spaces for day offset
if dayofweek ~= 7
   for j = 1:rem(dayofweek,7)
   fprintf("   ")
   end
end

% adds days
for i = 1:days

    % newline control
    if rem(i+dayofweek,7) == 1 && ~(i==1 && dayofweek==7)
        fprintf("\n")
    end
    
    % even spacing print
    fprintf("%3.0i",i)
  
end
fprintf("\n")
