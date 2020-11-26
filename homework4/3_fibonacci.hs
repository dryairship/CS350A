import Control.Monad.State (State, get, put, evalState)

statefulFibonacci :: State (Int, Int, Int) Int
statefulFibonacci = do
    (iterationsLeft, fib1, fib2) <- get
    if iterationsLeft<=0 then
        return fib1
    else do
        put (iterationsLeft-1, fib2, fib1+fib2)
        statefulFibonacci

fibonacci :: Int -> Int
fibonacci n = evalState statefulFibonacci (n, 0, 1)

main = do
    putStrLn $ show $ fibonacci <$> [1..10]
