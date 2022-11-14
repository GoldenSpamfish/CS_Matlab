function [songData, sessionStats, anotherQ]=singleQuestion(songData, ...
    sessionStats, numChoices, baseKvalue)
% Pick an appropriate artist to quiz about, generate choices to present to user, 
%   handles screen output and user interaction, and update statistics based 
%   on user's answer.

% Pre:
% songData is a cell array; each row stores the data of one artist.
% sessionStats is the 1x4 cell array containing the statistics of the 
%   entire session; it is organized as:
%   {userRating, totalCount, correctCount, history}
% numChoices is the number of choices to present to the user for this question.
% baseKvalue is the base "k value" for determining the user and artist rating.

% Post:
% songData is updated given the user's answer.
% sessionStats is updated given the user's answer and the choices presented.
% anotherQ=1 if user wants another question; otherwise anotherQ=0.

% Note:
% Call function updateData to update the all the statistics (in songData
%   and sessionStats).


% The following three statements are dummy initializations of the return 
% parameters; replace them with your code.

[len,~]=size(songData);
smol = inf;
list = {};
for i = 1:len
    if isempty(find([sessionStats{4}(:)] ==i))
        diff = songData{i,3} - sessionStats{1};
        if diff <smol 
            smol = diff;
            list = {i}; 

        elseif diff == smol
            list{1, length(list)+1} = i; 
        end
    end
end
[~, listSize]=size(list);
quest = list{randi(listSize)};
artist = songData{quest,1};
lyric = songData{quest,2};

fprintf('Which of the following lyrics are by "%s"?\n',artist)
lyrics=strings(21,5);
for i=1:5
    newlyr=songData{randi(len),2};
    while (any(lyrics(:)==newlyr))
        newlyr=songData{randi(len),2};
    end
lyrics(i)=newlyr;
end
correct=randi(5);
lyrics(correct)=lyric;
for n=1:5
    fprintf('%i. %s\n',n,lyrics(n))
end
tic
response=input('Type your choice here (0 to exit): 5\n');
time=round(toc*10);
anotherQ=1;
if response==correct
    [songData, sessionStats]=updateData(songData,sessionStats,quest,1,time,baseKvalue);
    fprintf('Congratulations! You got this question! You took %g seconds to solve it\n\n',time/10)
elseif response>0 && response < 6
    fprintf('Sorry, you were wrong! The correct choice is %i.\n\n',correct)
    [songData, sessionStats]=updateData(songData,sessionStats,quest,0,time,baseKvalue);
else
    anotherQ = 0;
    fprintf('You got %i out of %i questions correct.\n',sessionStats{3}, sessionStats{2});
    fprintf('Your new rating is %i.\n',sessionStats{1});
    fprintf('Have a nice day!\n');
end
if (time/10)>120
    disp('and ur slow\n')
end



