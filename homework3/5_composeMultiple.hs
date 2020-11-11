compose_multiple :: [b -> b] -> b -> b
compose_multiple [] a = a
compose_multiple (x:xs) a = x $ compose_multiple xs a

main :: IO ()
main = do
    putStrLn $ show $ compose_multiple [succ, (\x -> 2*x)] 3
    putStrLn $ show $ compose_multiple [succ, (\x -> x*x), pred, (\x -> x*x - 5)] 4
