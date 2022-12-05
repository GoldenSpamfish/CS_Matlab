classdef Schedule < handle
% A schedule has an Interval window in which events can be scheduled and 
% a cell array of Events.
    
    properties (SetAccess = private)
        sname= '';                % The name of the schedule
        window= Interval.empty(); % The Interval in which events can be 
                                  %   scheduled
        eventArray= {};           % The cell array of events
    end
    
    methods
        function s = Schedule(startTime, endTime, scheduleName)
        % Construct schedule s.  s.window goes from startTime to endTime.
        % s.sname is the string name that is shown on the schedule.
        % s.eventArray starts as an empty cell array.
            %%%% Write your code below %%%%
            if nargin>=2
                s.window=Interval(startTime,endTime);
            end
            if nargin==3
                s.sname=scheduleName;
            end

        end
        
        function addEvent(self, ev)
        % Adds Event ev to the end of self.eventArray
            %%%% Write your code below %%%%
            self.eventArray{length(self.eventArray)+1}=ev;

        end
        
        function extras = scheduleEvents(self)
        % Schedule events from self.eventArray in self.window.  First
        % unschedules all events.  Then use a heuristic to schedule events
        % as follows:
        % 1. Define a "remaining window," which is the window available for
        %    scheduling events.  Initialize the remaining window to be the 
        %    same as window (same left and right ends).
        % 2. Find the earliest unscheduled event that can be scheduled in
        %    the remaining window.
        % 3. If multiple events have the same earliest time, choose the
        %    event with the highest ratio of importance to duration.
        % 4. If the event is scheduled, update the remaining window.
        % 5. Repeat steps 2 to 4 until no events can be scheduled.
        % extras is a cell array of the Events (and Courses) that did not
        % get scheduled.  The length of extras is the number of events that
        % did not get scheduled.  If all events got scheduled then extras
        % is the empty cell array {}.
            
            %%%% Write your code below %%%%
            for event = self.eventArray
                event{1}.unschedule
            end
            remWin=Interval(self.window.left,self.window.right);

            earliest=Inf;
            earliestEvent=self.eventArray{1};
            canFit=true;
            while canFit
                canFit=false;
                for i = 1:length(self.eventArray)
                    self.eventArray
                    event=self.eventArray{i}(1);
                    if event.scheduledTime==-1
                        if event.available.isIn(remWin)
                            canFit=true;
                        elseif remWin.isIn(event.available)
                            canFit=true;
                        end
                         event.available
                         disp("earliest time remwin; " + event.earliestTime(remWin))
                        if event.earliestTime(remWin)<earliest
                            earliest=event.earliestTime(remWin);
                            earliestEvent=event;
                            earliestIndex=i;
                        elseif event.earliestTime(remWin)==earliest
                            if (event.importance/event.duration)>(earliestEvent.importance/earliestEvent.duration)
                                earliestEvent=event;
                                earliestIndex=i;
                            end
                        else
                        end
                    end
                end
                 self.eventArray{earliestIndex}(1).scheduledTime=earliest;
                remWin=Interval((earliestEvent.earliestTime(remWin) + earliestEvent.duration), remWin.right)
                %%%%%%%%%%%%%%%%%%%%%%%%%
                earliest=Inf;
            end
            extras={};
            for event=self.eventArray
                if event{1}.scheduledTime==-1
                    extras{length(extras)+1}=event;
                end
            end

        end
        
        function draw(self)
        % Draws the scedule and all the events.  This method sets up the 
        % figure window, shows the title (self.sname), labels the axes, and 
        % draws each event.  Figure window should be made full screen, 
        % ticks on the y-axis should only be drawn at integer (id) values 
        % and the axes should enclose only the scheduling window in the 
        % x-direction and only the range of event ids in the y-direction.

            %%%% Write your code below %%%%
            figure('units','normalized','outerposition',[0 .05 1 .95], 'name', 'Schedule')
            hold on
            minId = Inf;
            maxId = -Inf;
            for event = self.eventArray
                event{1}.draw
                Id = event{1}.getId;
                if Id ~= -1
                    if Id < minId
                        minId = Id;
                    end
                    if Id > maxId
                        maxId = Id;
                    end
                end               
            end
            xlabel('Time')
            ylabel('ID')
            set(gca, 'ytick', minId:maxId)
            axis([self.window.left self.window.right minId-1 maxId+1])
            hold off
        end
    end %methods
    
end

