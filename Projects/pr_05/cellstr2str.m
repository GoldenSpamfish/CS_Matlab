function ca= cellstr2str(nca)
% Convert a nested cell array to non-nested cell array.
% nca is a 1-d cell array, possibly nested, returned from a call of the 
%   textscan function on a char vector.
% If a cell in nca is a cell array storing one char vector, strip the inner 
%   cell wrapper, resulting in just that char vector in the cell.  Non- 
%   nested cells in nca remain unchanged.
% Example:
%   cellstr2str( {{'abc'}, 5, -3, {'h'}, {'defg'} )
% returns
%   {'abc', 5, -3, 'h', 'defg'}
 
ca= nca;
for k= 1:length(nca)
    if iscellstr(nca{k})  % returns true if arg is a cell array of char
                          %   arary
        ca{k}= char(nca{k});  % converts to char array
    end
end

