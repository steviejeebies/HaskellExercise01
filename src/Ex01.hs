module Ex01 where
import Data.Char (toUpper)

name, idno, username :: String
name      =  "Rowe, Stephen"  -- replace with your name
idno      =  "14319662"    -- replace with your student id
username  =  "rowes"   -- replace with your TCD username


declaration -- do not modify this
 = unlines
     [ ""
     , "@@@ This exercise is all my own work."
     , "@@@ Signed: " ++ name
     , "@@@ "++idno++" "++username
     ]


{- Part 1

Write a function 'raise' that converts a string to uppercase

Hint: 'toUpper :: Char -> Char' converts a character to uppercase
if it is lowercase. All other characters are unchanged.
It is imported should you want to use it.

-}
raise :: String -> String
raise str = [toUpper x | x <- str]

{- Part 2

Write a function 'nth' that returns the nth element of a list.
Hint: the test will answer your Qs

-}
nth :: Int -> [a] -> a
nth i xs = xs !! (i - 1)


{- Part 3

Write a function `commonLen` that compares two sequences
and reports the length of the prefix they have in common.

-}
commonLen :: Eq a => [a] -> [a] -> Int
commonLen [] _ = 0
commonLen _ [] = 0
commonLen xs ys 
    | (head xs) == (head ys) 
    = 1 + commonLen (tail xs) (tail ys)
    | otherwise = 0

{- Part 4

(TRICKY!) (VERY!)

Write a function `runs` that converts a list of things
into a list of sublists, each containing elements of the same value,
which when concatenated together give the same list

So `runs [1,2,2,1,3,3,3,2,2,1,1,4]`
 becomes `[[1],[2,2],[1],[3,3,3],[2,2],[1,1],[4]]`

Hint:  `elem :: Eq a => a -> [a] -> Bool`

HINT: Don't worry about code efficiency
       Seriously, don't!

-}
runs [] = []
runs xs =
    let (_, remainderArr, groupArr) = innerArr (head xs, tail xs, [])
    in groupArr : runs remainderArr     -- initially had [groupArr] ++ runs remainderArr, but using : is more efficient

-- helper function, returns a tuple - 'x' is the value used for comparison, 
-- 'xs' is the remainder of the full array being iterated, 'groupArr' is being built to make [1,1,1] or [2,2], etc
innerArr :: (Eq a) => (a, [a], [a]) -> (a, [a], [a])
innerArr (x, [], groupArr) = (x, [], x : groupArr)  -- returns if nothing left in the remainder array
innerArr (x, xs, groupArr)
    | x == head xs = innerArr (x, tail xs, x : groupArr)    -- recursive if equality found
    | otherwise = (x, xs, x : groupArr)     -- ends recursion of equality not found and returns