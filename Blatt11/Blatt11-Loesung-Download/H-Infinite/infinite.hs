import Data.List

strings :: Int -> [String]
strings 0 = [""]
strings n =  concat (map (\x -> map (\tail -> x:tail) tails) ['a'..'z'])
  where tails = strings (n-1)

palindrom :: [String]
palindrom = palindrom' 0
  where palindrom' n = (filter (\x -> x == reverse x) (strings n)) ++ palindrom' (n+1)

--palindrom' stellt alternative Loesungsmoeglichkeit dar
palindrom' :: [String]
palindrom' =
  simplePalindroms ++ concat (map (\s -> map (\c -> c:s ++ [c]) chars) palindrom')
  where chars = ['a'..'z']
        simplePalindroms = "" : map (\c -> [c]) chars

divisors :: Int -> [Int]
divisors x = filter (\y -> mod x y == 0) [1..div x 2]

semiperfect :: [Int]
semiperfect = filter (\x -> any (\xs -> sum xs == x) (subsequences (divisors x))) [2..]

fib :: [Int]
fib = 0 : 1 : fibInit 0 1

fibInit :: Int -> Int -> [Int]
fibInit n m = (n+m) : fibInit m (n+m)
