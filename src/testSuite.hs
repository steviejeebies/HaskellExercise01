runs :: Eq a => [a] -> [[a]]
runs [] = [[]]
runs xs = [head xs : (test (head xs) (tail xs))] ++ runs (tail xs)

test x xs
    | x == head xs = head xs : test (head xs) (tail xs)
    | otherwise = []