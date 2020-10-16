runs :: Eq a => [a] -> [[a]]

-- current issues:
--  ++ runs remainingArray almost always returns an extra [] to the end of the array
runs [] = []
runs xs =
    let (comp, remainingArray, rA) = test ((head xs), (tail xs), [])
    in [rA] ++ runs remainingArray

test :: (Eq a) => (a, [a], [a]) -> (a, [a], [a])
test (x, [], rA) = (x, [], x : rA)
test (x, xs, rA)
    | x == (head xs) = test (x, (tail xs), (x : rA))
    | otherwise = (x, xs, x : rA)