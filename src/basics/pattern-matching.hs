data Color = Red | Green | Blue | Indigo deriving Show

head          ::  [a] -> a
head (x:_)    =   x
head []       =   error "head error: empty list"

-- pattern matching can be rewriten as expression

head' ::  [a] -> a
head' xs = case xs of
    (x:_)   -> x
    []      -> error "head': empty list"


isRGB :: Color -> Bool
isRGB Red = True
isRGB Green = True
isRGB Blue = True
isRGB _ = False -- Wild Card

-- pattern matching goes from top to bottom and from left to rigth

-- pattern matching cases

-- 1) succeed
-- 2) fail
-- 3) diverge

--- foo (1,2) = 3
--- foo (0, _) = 5

-- (0, undefined) - fail in first, success in second
-- (undefined, 0) - diverge in first
-- (2, 1) - two fails, Consequently "diverge"
-- (1, 5-3) - first success, second fails
-- (NOTE: due to pattern matching 5-3 forces for calculation cause we need value)

-- As pattern

dupFirst :: [a] -> [a]
dupFirst (x:xs) = x:x:xs

-- s as pattern sample

dupFirst' :: [a] -> [a]
dupFirst' s@(x:xs) = x:s

-- Lazy pattern
-- pattern always mathes even its fails

(***) f g ~(x, y) = (f x, g y)

-- GHCi (const 1 *** const 2) undefined
-- (1, 2)

-- factorial
factorial 0 = 1
factorial n = n * factorial (n - 1)