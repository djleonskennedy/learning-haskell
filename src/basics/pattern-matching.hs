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