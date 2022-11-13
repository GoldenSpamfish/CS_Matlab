function [songData, sessionStats]=updateData(songData, sessionStats, ...
    artistIdx, isCorrect, timeTaken, baseKvalue)
% Update and return song data and session statistics given the most
% recent question and user answer.

% Pre:
% songData is a cell array; each row stores the data of one musical artist
% sessionStats is a cell array containing the statistics of the entire
%   session.
% artistIdx is the index of the artist used in the most recent question; it is
%   the row index of that artist in songData.
% isCorrect is true (1) if user had answered the question correctly; it is
%   false (0) otherwise.
% timeTaken is the actual time, in tenths of a second, user took to answer 
%   the question; it is an integer value.
% baseKvalue:  Base "k value" for determining user and artist ratings

% Post:
% songData and sessionStats are updated based on correctness and time
%   taken to answer the question.

% *** Write your code below to perform the following tasks: ***
% (1) Calculate new user rating and artist rating--call subfunction
%     computeRating.
% (2) Calculate new average time user takes to identify the artist with index
%     artistIdx.
% (3) Update songData and sessionStats.
% The following two statements are dummy initializations of the return 
% parameters; replace them with your code.
songData = songData;
sessionStats = sessionStats;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DO NOT MODIFY the following subfunction.
function [userRating, artistRating]=computeRating(userRating, artistRating, ...
    isCorrect, timeTaken, aveTimeTaken, baseKvalue)
% Compute and return the new user rating and artist rating.
% Pre:
% userRating - User rating before user answered the most recent question
% artistRating - Artist rating before user answered most recent question (on
%              that artist)
% isCorrect - True (1) if user answered correctly; false(0) otherwise.
% timeTaken - Actual time, in tenths of a second, user took to answer the
%             question.  (An integer value)
% aveTimeTaken - Estimated time, in tenths of a second, for answering the 
%                question.  (An integer value)
% baseKvalue - Base "k value" for determining user and artist ratings
% Post:
% userRating and artistRating are updated based on a variant of the Elo 
% rating system.

% Calculate chance that user will get correct answer for this test:
correctChance=userRating/(userRating+artistRating);

% Calculate actual Kvalue and if necessary adjust it to be in the interval
% [0, 1.5*baseKvalue] if the user answers correctly.  If user answers
% incorrectly Kavlue is baseKvalue.
if isCorrect
    Kvalue= baseKvalue+(aveTimeTaken-timeTaken)/10;
    Kvalue= min(max(Kvalue, 0.3*baseKvalue), 1.5*baseKvalue);
else
    Kvalue= baseKvalue;
end

% Update both user rating and artist rating
userRating= round(userRating+Kvalue*(isCorrect-correctChance));
artistRating= round(artistRating-Kvalue*(isCorrect-correctChance));
