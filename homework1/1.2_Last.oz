declare
fun {Last Xs N}
    local Length Drop in
        fun {Length Xs}
            case Xs
            of nil then 0
            else 1 + {Length Xs.2}
            end
        end
        fun {Drop Xs N}
            case Xs
            of nil then nil
            else
                if N =< 0 then Xs
                else {Drop Xs.2 N-1}
                end
            end
        end
        {Drop Xs {Length Xs}-N}
    end
end

% Some Tests
{Browse {Last [1 2 3 4 5 6 7 8 9] ~3}}
{Browse {Last [1 2 3 4 5 6 7 8 9] 0}}
{Browse {Last [1 2 3 4 5 6 7 8 9] 5}}
{Browse {Last [1 2 3 4 5 6 7 8 9] 9}}
{Browse {Last [1 2 3 4 5 6 7 8 9] 100000}}
{Browse {Last nil 10}}
