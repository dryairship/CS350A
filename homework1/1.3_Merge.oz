%%%%%%%%%%%%%% Attempt 1 %%%%%%%%%%%%%
%%% Cons: Not tail recursive
%%% Pros: Shorter code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
declare
fun {Merge As Bs}
    case As#Bs
    of nil#nil then nil
    [] Xs#nil then Xs
    [] nil#Xs then Xs
    else
        if As.1 =< Bs.1
        then As.1 | {Merge As.2 Bs}
        else Bs.1 | {Merge As Bs.2}
        end
    end
end
*/

%%%%%%%%%%%%%% Attempt 2 %%%%%%%%%%%%%
%%% Pros: Tail recursive
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

declare
fun {Merge As Bs}
    local MergeTR InvertTR in
        fun {InvertTR Xs Ys}
            case Xs
            of nil then Ys
            [] H|T then {InvertTR H T|Ys}
            end
        end
        fun {MergeTR As Bs Ys}
            case As#Bs
            of nil#nil then Ys
            [] Xs#nil then {MergeTR Xs.2 nil Ys|Xs.1}
            [] nil#Xs then {MergeTR Xs.2 nil Ys|Xs.1}
            else
                if As.1 =< Bs.1
                then {MergeTR As.2 Bs Ys|As.1}
                else {MergeTR As Bs.2 Ys|Bs.1}
                end
            end
        end
        {InvertTR {MergeTR As Bs nil} nil}
    end
end

% Some Tests
{Browse {Merge [1 2 4 8 16] [1 3 9 27]}}
{Browse {Merge [1 1 1] [1 3 9 27 81]}}
{Browse {Merge nil [1 3 9 27 81]}}
{Browse {Merge [1 2 4 8 16] nil}}
{Browse {Merge nil nil}}
{Browse {Merge [1 2 3 4 5] [6 7 8]}}
{Browse {Merge [6 7 8] [1 2 3 4 5]}}
