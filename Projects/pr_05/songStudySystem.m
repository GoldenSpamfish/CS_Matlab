function sessionStats = songStudySystem(inFilename,outFilename)
% Run one session of the song study system and update data.
% inFilename is the name of the input data file (current folder or specify 
%   full path).
% outFilename is the name the output data file (current folder or specify 
%   full path).  Output data file includes the data of all the artists from 
%   the input data file and has the same format as the input data file.
% sessionStats is a cell array of length 4 storing the statistics of the  
%   entire session:   
%   sessionStats{1} is the user rating
%   sessionStats{2} is the total number of questions answered
%   sessionStats{3} is the number of questions answered correcly
%   sessionStats{4} is a vector storing the indices of the "recently" used
%   artists

%%%% DO NOT modify this function %%%%

clc

% Constants
baseKvalue= 30;    % Base "k value" for determining user and artist ratings 
numChoices= 5;     % Number of choices to present to user for each artist
historyCount= 15;  % Artists that were used in the previous historyCount
                   %   questions are considered "recently" used
    
% Read song data from file
[songData, userRating]= readSongData(inFilename);

% Session data
totalCount = 0;
correctCount = 0;
history = zeros(historyCount, 1);
sessionStats = {userRating, totalCount, correctCount, history};

% Run this song study session
fprintf('Welcome to the adaptive song study aid!\n')
fprintf('Your current rating is %d.\n\n', sessionStats{1})
fprintf('Here is the first question for you:\n\n')

[songData, sessionStats, anotherQ]= singleQuestion(songData, ...
    sessionStats, numChoices, baseKvalue);

while anotherQ
    [songData, sessionStats, anotherQ]= singleQuestion(songData, ...
        sessionStats, numChoices, baseKvalue);
end

fprintf('You got %d out of %d questions correct.\n', sessionStats{3}, ...
                                                     sessionStats{2})
fprintf('Your new rating is %d.\n', sessionStats{1})
fprintf('Have a nice day!\n')

% Output results to the file identified by outFilename
outputSongData(songData, sessionStats, outFilename)