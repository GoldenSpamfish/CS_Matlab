% prints a one-month calendar
days = input("Enter how many days in the month: ");
dayofweek = input("Starting day-of-the-week (1=Mon, 7=Sun): ");


fprintf("Su Mo Tu We Th Fr Sa\n")
if dayofweek ~= 7
   for j = 1:rem(dayofweek,7)
   fprintf("   ")
   end
end
for i = 1:days
    if rem(i+(7-dayofweek),7) == 0
        fprintf("\n")
    end
    if i<10
        fprintf("%d  ",i)
    else
        fprintf("%d ",i)
    end
end
fprintf("\n")
