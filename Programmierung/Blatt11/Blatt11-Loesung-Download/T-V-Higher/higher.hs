data List a = Nil | Cons a (List a) deriving Show

list :: List Int
list = Cons (-3) (Cons 14 (Cons (-6) (Cons 7 (Cons 1 Nil))))

blist :: List Int
blist = Cons 1 (Cons 1 (Cons 0 (Cons 0 (Cons 1 Nil))))

-- a)
filterList :: (a -> Bool) -> List a -> List a
filterList _ Nil = Nil
filterList f (Cons x xs) | f x  = Cons x rest
                         | otherwise = rest
  where rest = filterList f xs

-- b)
divisibleBy :: Int -> List Int -> List Int 
divisibleBy n = filterList (\x -> (mod x n) == 0)

-- c)
foldList :: (a -> b -> b) -> b -> List a -> b
foldList _ c Nil         = c
foldList f c (Cons x xs) = f x (foldList f c xs)

-- d)
listMaximum :: List Int -> Int
listMaximum = foldList max minBound

-- e)
mapList :: (a -> b) -> List a -> List b
mapList f xs = foldList (\x y -> Cons (f x) y) Nil xs

-- f)
zipLists :: (a -> b -> c) -> List a -> List b -> List c
zipLists _ Nil _ = Nil
zipLists _ _ Nil = Nil
zipLists f (Cons x xs) (Cons y ys) = Cons (f x y)  (zipLists f xs ys)

-- g)
skalarprodukt :: List Int -> List Int -> Int
skalarprodukt x y = foldList (+) 0 (zipLists (*) x y)
