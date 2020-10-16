runs :: Eq a => [a] -> [[a]]
runs [] = [[]]
runs xs = [head xs : (test (head xs) (tail xs))] ++ runs (tail xs)

test :: (Eq a) => (Int, a, [a]) -> (Int, a, [a])

test (n, x, []) = (n, x, [])
test (n, x, xs)
    | x == (head xs) = test ((n+1), x, (tail xs))
    | otherwise = (n, x, xs)
