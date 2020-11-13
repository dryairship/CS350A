neighbors ::  (Ord a1, Ord a2, Num a1, Num a2) => a1 -> a2 -> [(a1,  a2)]
neighbors x y = filter (/=(x,y)) $ filter0 $ filter10 $ allNeighbours
    where allNeighbours = [(x1, y1) | x1 <- [x-1, x, x+1], y1 <- [y-1, y, y+1]]
          filter0  xs   = filter ((>=0).fst) $ filter ((>=0).snd) $ xs
          filter10 xs   = filter ((<10).fst) $ filter ((<10).snd) $ xs

main :: IO ()
main = do
    putStrLn $ show $ neighbors 0 9
    putStrLn $ show $ neighbors 3 4
    putStrLn $ show $ neighbors 8 9
