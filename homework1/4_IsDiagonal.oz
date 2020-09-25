declare
fun {IsDiagonal M}
    local AreAllRowsValid AreAllCellsValid in
        fun {AreAllCellsValid Arr Row Col}                      % Checks if only (Row)th cell is non-zero in the array
            case Row#Col#Arr
            of _#_#nil then true                                % Reached end of array
            [] X#X#(_|T) then {AreAllCellsValid T Row Col+1}    % Case when row == column, this cell can hold any value
            [] _#_#(0|T) then {AreAllCellsValid T Row Col+1}    % Case when row != column, this cell must be 0
            else false
            end
        end
        fun {AreAllRowsValid Matrix CurrentRow}
            case Matrix
            of nil then true
            [] (H|T) then 
                if {AreAllCellsValid H CurrentRow 0}
                then {AreAllRowsValid T CurrentRow+1}
                else false
                end
            end
        end
        {AreAllRowsValid M 0}
    end
end

{Browse {IsDiagonal [[1 0 0] [0 2 0] [0 0 3]]}}
{Browse {IsDiagonal [[1 0 0 0 0] [0 2 0 0 0] [0 0 3 0 0] [0 0 0 4 0] [0 0 0 0 5]]}}
{Browse {IsDiagonal [[1]]}}
{Browse {IsDiagonal nil}}
{Browse {IsDiagonal [[0 0 0] [0 0 0] [0 0 0]]}}
{Browse {IsDiagonal [[1 1 1] [1 1 1] [1 1 1]]}}
{Browse {IsDiagonal [[0 0 1] [0 1 0] [1 0 0]]}}
