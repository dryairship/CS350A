declare
fun {Square A}
    A*A
end

fun {Map List F}
    local DoFAndAppend in
        fun {DoFAndAppend A B}
            {F A} | B
        end
        {FoldR List DoFAndAppend nil}
    end
end

% This implementation is the same as above, except
% that it uses an anonymous function, which reduces
% the code to one line. However, the previous code
% is better in terms of readability.
/*
fun {Map List F}
    {FoldR List fun {$ A B} {F A}|B end nil}
end
*/

% Some tests
{Browse {Map [1 2 3 4 5] Square}}
{Browse {Map [100] Square}}
{Browse {Map nil Square}}
