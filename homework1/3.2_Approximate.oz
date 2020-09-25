declare
fun lazy {TaylorSin X}
    local AuxillaryTaylorSin in
        fun lazy {AuxillaryTaylorSin N CurrentTerm}
            CurrentTerm | {AuxillaryTaylorSin N+2 ~CurrentTerm*X*X/{IntToFloat (N+1)*(N+2)}}
        end
        {AuxillaryTaylorSin 1 X}
    end
end

% Since the question was slightly ambiguous about
% "until then", I have assumed the following:
% Let S = s(1), s(2), s(3), .... s(i), s(i+1), s(i+2), ....
% where i is the smallest integer such that
% Abs(s(i)-s(i+1)) <= Epsilon, then the 
% answer returned by the function is 
% Ans = s(1)+s(2)+s(3)+...+s(i)+s(i+1)
% If the sum required is s(1)+s(2)+s(3)+...+s(i),
% then on line 22, S.1+S.2.1 can be changed to S.1

fun {Approximate S Epsilon}
    if {Abs S.1-S.2.1} =< Epsilon
    then S.1+S.2.1
    else S.1 + {Approximate S.2 Epsilon}
    end
end

{Browse {Approximate {TaylorSin 0.5} 0.001}}
{Browse {Approximate {TaylorSin 0.5} 0.1}}
{Browse {Approximate {TaylorSin 0.1} 0.001}}
{Browse {Approximate {TaylorSin 0.9} 0.001}}
