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

%% Some tests
{Browse {Take [1 2 3 4 5 6 7 8 9] ~3}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 0}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 5}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 9}}
{Browse {Take [1 2 3 4 5 6 7 8 9] 100000}}
{Browse {Take nil 10}}
