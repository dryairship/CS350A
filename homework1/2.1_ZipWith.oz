declare
fun {Add A B}
    A+B
end
fun {Subtract A B}
    A-B
end
fun {Multiply A B}
    A*B
end

fun {ZipWith BinOp Xs Ys}
    case Xs#Ys
    of nil#_ then nil
    [] _#nil then nil
    else {BinOp Xs.1 Ys.1} | {ZipWith BinOp Xs.2 Ys.2}
    end
end

{Browse {ZipWith Add [1 2 3 4 5] [6 7 8 9 10]}}
{Browse {ZipWith Multiply [1 2 3 4 5] [6 7 8 9 10]}}
{Browse {ZipWith Subtract [1 2 3 4 5] [6 7 8 9 10]}}
