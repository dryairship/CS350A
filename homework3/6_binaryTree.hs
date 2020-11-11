-- 6 (a)
data BinaryTree a = Node a (BinaryTree a) (BinaryTree a) | Nil deriving (Show)

-- 6 (b)
mapTree :: (a->b) -> BinaryTree a -> BinaryTree b
mapTree f Nil = Nil
mapTree f (Node root left right) = Node (f root) (mapTree f left) (mapTree f right)

--6 (c)
foldTree :: (a -> b -> b -> b) -> b -> BinaryTree a -> b
foldTree f v Nil = v
foldTree f v (Node root left right) = f root (foldTree f v left) (foldTree f v right)
-- Note that the type signature of the parameter f requires that root be the first parameter passed to it.
-- This is why I chose the pre-order style for passing the parameters.


-- Examples follow:
{-
Binary Tree used in the example:

        3
      /   \
    /       \
    7        0
  /  \     /  \
 2   6    8   9
    /        / \
   5        1  4  

-}

getExampleBinaryTree :: BinaryTree Int
getExampleBinaryTree = nodeThree
    where nodeTwo   = Node 2 Nil Nil
          nodeFive  = Node 5 Nil Nil
          nodeEight = Node 8 Nil Nil
          nodeOne   = Node 1 Nil Nil
          nodeFour  = Node 4 Nil Nil
          nodeSix   = Node 6 nodeFive Nil
          nodeNine  = Node 9 nodeOne nodeFour
          nodeSeven = Node 7 nodeTwo nodeSix
          nodeZero  = Node 0 nodeEight nodeNine
          nodeThree = Node 3 nodeSeven nodeZero


add3 :: (Num a) => a -> a -> a -> a
add3 a b c = a+b+c

main :: IO ()
main = do
    let tree = getExampleBinaryTree
    putStrLn $ show $ tree
    putStrLn $ show $ mapTree (\x -> fromIntegral x / 2) tree
    putStrLn $ show $ mapTree (\x -> x*x) tree
    putStrLn $ show $ foldTree add3 0 tree
    putStrLn $ show $ foldTree add3 0 (Node 3 Nil (Node 2 Nil Nil))
