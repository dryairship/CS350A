countWords :: String -> Int
countWords s = length $ words s

main :: IO ()
main = do
    putStrLn $ show $ countWords "word1 word2 word3 word4"
    putStrLn $ show $ countWords "word1 word2 word3 word4\nword5 word6\nword7"
    putStrLn $ show $ countWords "word1 word2 word3 word4\n\
                                 \word5 word6 word7 word8\n\
                                 \word9 word10"
