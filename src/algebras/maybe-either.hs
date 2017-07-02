-- Maybe

data Maybe a = Nothing | Just a

-- PM elimination
maybe :: b -> (a -> b) -> Maybe a -> b

find :: (a -> Bool) -> [a] -> Maybe a

-- Either

data Either a b = Left a | Rigth b

-- PM elimination
either :: (a -> c) -> (b -> c) -> Either a b -> c

-- e.g.

head' :: [a] -> Either String a
head' (x:_) = Rigth x
head' [] = Left "head': empty list"