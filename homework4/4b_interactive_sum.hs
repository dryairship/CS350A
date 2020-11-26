interactiveSum :: IO Int
interactiveSum = getLine >>=
    (\line -> return (read line :: Int)) >>=
    (\num -> if num < 0 then return 0 else fmap (+num) interactiveSum)

main :: IO ()
main = interactiveSum >>= (\x -> putStrLn $ show $ x)
