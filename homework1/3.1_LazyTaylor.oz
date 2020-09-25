declare
fun lazy {TaylorSin X}
    local AuxillaryTaylorSin in
        fun lazy {AuxillaryTaylorSin N CurrentTerm}
            CurrentTerm | {AuxillaryTaylorSin N+2 ~CurrentTerm*X*X/{IntToFloat (N+1)*(N+2)}}
        end
        {AuxillaryTaylorSin 1 X}
    end
end

B={TaylorSin 0.5}

%{Browse B.1}               % calculate 1st term
%{Browse B.2.1}             % calculate 2nd term
{Browse B.2.2.1}           % calculate 3rd term
%{Browse B.2.2.2.1}         % calculate 4th term
%{Browse B.2.2.2.2.1}       % calculate 5th term
%{Browse B.2.2.2.2.2.1}     % calculate 6th term
%{Browse B.2.2.2.2.2.2.1}   % calculate 7th term

{Browse B}                  % B will be displayed only till those terms which have been calculated
