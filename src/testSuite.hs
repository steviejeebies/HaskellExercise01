runs :: Eq a => [a] -> [[a]]
runs [] = [[]]
-- runs xs = [head xs : (test (head xs) (tail xs))] ++ runs (tail xs)

-- runs xs =
--     let (index, comp, remainingArray, rA) = test (0, (head xs), (tail xs), [])
--     in [rA] ++ runs remainingArray

test :: (Eq a) => (a, [a], [a]) -> (a, [a], [a])
test (x, [], rA) = (x, [], rA)
test (x, xs, rA)
    | x == (head xs) = test (x, (tail xs), (x : rA))
    | otherwise = (x, xs, rA)
