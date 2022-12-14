% testScript for Project 6 classes

close all

% Test class Interval
i1= Interval(3,9); 
i2 = Interval(4,9);
i3=Interval(21,35);% Instantiate an Interval with endpoints 3 and 9
L= i1.left;          % Should be 3. The properties have the attribute "public"  
                    %  so it is possible to access the property left directly.
a2= i1.overlap( Interval(5,15) );
                    % o references an Interval with endpoints 5 and 9.
w= a2.getWidth();    % Should be 4, the width of the Interval referenced by a2


% Test class Event
% e1= Event(3, 20, 10, .5, 4);
% An Event with id 4, importance .5, and duration 10.
% It’s available for scheduling in the interval [3,20].
% disp(e1.available.right) % Should be 20
% disp(e1.available.getWidth()) % Should be 17
% % disp(e1.id) % Error: id is private
% e1.setScheduledTime(5)
% figure; hold on
% e1.draw() % Should see colored box with left edge at x=5
% hold off
% e1.available
% e1.available.right
% e1.available.getWidth()
% e1.earliestTime(i1)
% e1.earliestTime(i2)
% e1.earliestTime(i3)
% in = Interval(0,40);
% e1.earliestTime(i1)
% e1.earliestTime(i2)
% e1.earliestTime(i3)
% e2= Event(0, 30, 8, .3, 1);
% e3= Event(8, 25, 6, 0, 5);
% e4 = Event( 10, 38, 5, 1, 2);
% e2.earliestTime(in)
% e3.earliestTime(in)
% e4.earliestTime(in)
% e1.scheduledTime
% e1.setScheduledTime(2)
% e1.scheduledTime
% 
% e1.unschedule()
% 
% 
% e1.getId


% Test class Schedule
% sched=Schedule(2,9,"shed")
% sched.addEvent(e1)

% e2= Event(0, 30, 8, .3, 1);
% e3= Event(8, 25, 6, 0, 5);
% s = Schedule(0, 40, 'Test Schedule'); % Instantiate a Schedule object. s.eventArray is empty.
% s.sname= 'New name' % ERROR: property sname has private set access
% disp(s.sname) % Should see ’Test Schedule’ since get access is public
% s.addEvent(e2); % Add Event e2 to s.eventArray
% s.addEvent(e3);
% s.addEvent( Event( 10, 38, 5, 1, 2) );
% s
% disp(s) % s.eventArray should be a length 3 cell array of Events
% s.eventArray{1}.getId() % Should see 1
% s.eventArray{1}.setScheduledTime(21)
% s.scheduleEvents
% for event=s.eventArray
%     disp(event{1})
%     id=event{1}.getId
% end

% s.draw() % Should see colored box with left edge at x=21


% % Test class Course
% c1= Course(8, 25, 6, 0.5, 6, 'CS1000')
% figure; hold on
% c1.draw() % Should see white box with x range of 8 to 25
% c1.setScheduledTime(9)
% hold off
% figure; hold on
% c1.draw() % Should see colored box with left edge at x=9 and
% % the course name in the middle
% hold off
% s.addEvent(c1)
% disp(s.eventArray) % Should see that the last cell references a Course,
% % not an Event
% 
% %Test createSchedule
% % createSchedule('eventdata1.txt',0,100)
 createSchedule('eventdata2.txt',0,100)
%  interval1=Interval(2,10)
%  interval2=Interval(0,10)
%  interval1.isIn(interval2)
