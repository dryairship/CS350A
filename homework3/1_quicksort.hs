quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = smaller ++ x:larger
    where smaller = (quicksort $ filter (<  x) xs)
          larger  = (quicksort $ filter (>= x) xs)

main :: IO ()
main = do
    putStrLn $ show $ quicksort [7,3,4,2,5,9,1,6,0,8]
    putStrLn $ show $ quicksort ["uvwx", "efgh", "mnop", "yz", "qrst", "ijkl", "abcd"]
    putStrLn $ show $ quicksort [3.01, 3.00001, 3.1, 3.0001, 3.001, 3.00000001, 3.0000000000001]
