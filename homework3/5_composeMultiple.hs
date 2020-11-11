compose_multiple :: [b -> b] -> b -> b
compose_multiple fs a = foldr (.) id fs a

main :: IO ()
main = do
    putStrLn $ show $ compose_multiple [succ, (\x -> 2*x)] 3
    putStrLn $ show $ compose_multiple [succ, (\x -> x*x), pred, (\x -> x*x - 5)] 4
