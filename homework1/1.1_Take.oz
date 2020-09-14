%%%%%%%%%%%%%% Attempt 1 %%%%%%%%%%%%%
%%% Cons: Not tail recursive
%%% Pros: Shorter code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
declare
fun {Take Xs N}
	case Xs
	of nil then nil
	[] H|T then
		if N =< 0
		then nil
		else H | {Take T N-1}
		end
	end
end
*/

%%%%%%%%%%%%%% Attempt 2 %%%%%%%%%%%%%
%%% Pros: Tail recursive!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

declare
fun {Take Xs N}
	local TakeTR InvertTR in
		% InvertTR converts structures like ((((nil|1)|2)|3)|4)|5 to [1 2 3 4 5]
		% This looks like inverting a reverse list
		fun {InvertTR Xs Ys}
			case Xs
			of nil then Ys
			[] H|T then {InvertTR H T|Ys}
			end
		end
		fun {TakeTR Xs N Ys}
			if N =< 0
			then Ys
			else case Xs
				of nil then Ys
				[] H|T then {TakeTR T N-1 Ys|H}
				end
			end
		end
		{InvertTR {TakeTR Xs N nil} nil}
	end
end

%% Some tests
{Browse {Take [1 2 3 4 5 6 7 8 9] ~3}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 0}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 5}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 9}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 100000}}
{Browse {Take nil 10}}
