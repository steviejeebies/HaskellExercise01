runs :: Eq a => [a] -> [[a]]
runs [] = [[]]
-- runs xs = [head xs : (test (head xs) (tail xs))] ++ runs (tail xs)

runs xs =
    let (index, comp, remainingArray, rA) = test (0, (head xs), (tail xs), [])
    in [rA] ++ runs remainingArray

test :: (Eq a) => (Int, a, [a], [a]) -> (Int, a, [a], [a])
test (n, x, [], rA) = (n, x, [], rA)
test (n, x, xs, rA)
    | x == (head xs) = test ((n+1), x, (tail xs), (x : rA))
    | otherwise = (n, x, xs, rA)
