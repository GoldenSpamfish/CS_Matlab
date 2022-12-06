function [s, extras] = createSchedule( dataFilename, scheduleStart, ...
                                       scheduleFinish )
%Creates a schedule based on the events data in a text file.
%   dataFilename is a string that names the text data file.
%   All events in dataFilename are added to a schedule within a window from
%   scheduleStart to scheduleFinish.  The events are then scheduled using
%   a heuristic (given in class Schedule), and the schedule is drawn.
%   dataFilename is the name of a file encoding data for all events to add
%   to the newly created schedule. Events are encoded in a given line L as 
%   follows: id = L(3:6), startAvailable = L(8:11), endAvailable= L(13:16),
%   duration = L(18:21), and importance = L(23:28). L(1) is 'e' if the line
%   represents a base Event, while L(1) is 'c' if it is a Course.  If the
%   event is a course, L(30:end) encodes the name of the course.

% Open the appropriate file
eventDataFile = fopen(dataFilename,"r");

% Instantiate a Schedule object (no event is scheduled yet)
s = Schedule(scheduleStart, scheduleFinish, 'My Schedule');

% Read data from file and add the Event (or Course) to s.eventArray
%%%% Write your code below %%%%

k=0;

% File traversal
% This would be done better with the csvread built in
while~feof(eventDataFile)
    k=k+1;

    % splits file into lines and then comma sep values
    line = fgetl(eventDataFile);
    lineSplit=strsplit(line,","); 

    % uses event or course class based on file
    if lineSplit{1}=='e'
        event=Event(str2double(lineSplit{3}),str2double(lineSplit{4}),str2double(lineSplit{5}),str2double(lineSplit{6}),str2double(lineSplit{2}));
        s.addEvent(event)
    elseif lineSplit{1}=='c'
        event=Course(str2double(lineSplit{3}),str2double(lineSplit{4}),str2double(lineSplit{5}),str2double(lineSplit{6}),str2double(lineSplit{2}),lineSplit{7});
        s.addEvent(event)
    end
end

% Close the data file
fclose(eventDataFile);

% Schedule the events
%%%% Write your code below %%%%
s.scheduleEvents

% Draw the schedule
%%%% Write your code below %%%%
s.draw

end

