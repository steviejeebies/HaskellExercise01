runs [] = []
runs xs =
    let (_, remainderArr, groupArr) = innerArr (head xs, tail xs, [])
    in [groupArr] ++ runs remainderArr

-- helper function, returns a tuple - 'x' is the value used for comparison, 
-- 'xs' is the remainder of the full array being iterated, 'groupArr' is being built to make [1,1,1] or [2,2], etc
innerArr :: (Eq a) => (a, [a], [a]) -> (a, [a], [a])
innerArr (x, [], groupArr) = (x, [], x : groupArr)  -- returns if nothing left in the remainder array
innerArr (x, xs, groupArr)
    | x == head xs = innerArr (x, tail xs, x : groupArr)    -- recursive if equality found
    | otherwise = (x, xs, x : groupArr)     -- ends recursion of equality not found and returns