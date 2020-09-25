declare
fun {Add A B}
    A+B
end
fun {Subtract A B}
    {Browse [A B (A-B)]} % To show that the order of calculation is indeed what is required
    A-B
end
fun {Multiply A B}
    A*B
end

fun {FoldL List BinOp Ans} % The Indentity element is called "Ans", since it will store
    case List              % the answer of the operation so far, in the recursive calls.
    of nil then Ans
    else {FoldL List.2 BinOp {BinOp Ans List.1}}
    end
end

{Browse {FoldL [1 2 3 4 5] Add 0}}
{Browse {FoldL [1 2 3 4 5] Subtract 0}}
{Browse {FoldL [1 2 3 4 5] Multiply 1}}
