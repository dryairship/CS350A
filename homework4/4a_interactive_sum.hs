interactiveSum :: IO Int
interactiveSum = do
    line <- getLine
    let num = read line :: Int
    if num < 0 then return 0
    else fmap (+num) interactiveSum

main :: IO ()
main = do
    sum <- interactiveSum
    putStrLn $ show $ sum
