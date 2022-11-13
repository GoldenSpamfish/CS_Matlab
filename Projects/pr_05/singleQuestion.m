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
songData = songData;
sessionStats = sessionStats;
anotherQ = 0;
