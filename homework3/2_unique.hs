uniq :: Eq a => [a] -> [a]
uniq [] = []
uniq (x:xs)
    | any (==x) suffix = suffix -- If "suffix"  already contains "x", return "suffix"
    | otherwise = x:suffix
    where suffix = uniq xs

main = do
    putStrLn $ show $ uniq [1,2,3,4,5,6,7]
    putStrLn $ show $ uniq [1,2,3,4,5,6,7,1,2,3,4,5,6,7,8,9,1,2,3,4,5]
    putStrLn $ show $ uniq ["ab", "ac", "ab", "cd", "ab", "cd", "ef"]
    putStrLn $ show $ uniq [1/2, 2/4, 3/6, 4/8, 5/10, 6/12]
