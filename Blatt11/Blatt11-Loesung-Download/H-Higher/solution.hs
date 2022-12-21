data Tree = Nil | Node Int Tree Tree deriving Show

testTree = Node 2
             (Node 4 (Node 9 Nil Nil) (Node 3 Nil (Node 7 Nil Nil)))
             (Node 17 Nil Nil)

-- a)
foldTree :: (Int -> a -> a -> a) -> a -> Tree -> a
foldTree _ c Nil = c
foldTree f c (Node v l r) = f v (foldTree f c l) (foldTree f c r)

-- b)
decN = \v l r -> Node (v - 1) l r
sumN = \v l r -> v + l + r
flattenN = \v l r -> v : l ++ r

decTree'' t = foldTree decN Nil t
sumTree'' t = foldTree sumN 0 t
flattenTree'' t = foldTree flattenN [] t

-- c)
prodTree = foldTree (\x y z -> x * y * z) 1

-- d)
incTree = foldTree (\x y z -> Node (x+1) y z) Nil

-- e)
mirrorTree = foldTree (\v l r -> Node v r l) Nil

-- f)
leaves = foldTree leavesN [] where
 leavesN v [] [] = [v]
 leavesN _ xs ys = xs ++ ys
