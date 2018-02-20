
-- typeclass type
class Monad m where
    return :: a -> m a
  
    (>>=) :: m a -> (a -> m b) -> m b
  
    (>>) :: m a -> m b -> m b -- x >> y = x >>= \_ -> y
  
    fail :: String -> m a  
    fail msg = error msg

-- Maybe Monad
instance Monad Maybe where
    return x = Just x
    Nothing >>= f = Nothing
    Just x >>= f  = f x
    fail _ = Nothing

-- e.g.
return "WHAT" :: Maybe String  
-- Just "WHAT"  
Just 9 >>= \x -> return (x*10)  
-- Just 90  
Nothing >>= \x -> return (x*10)  
-- Nothing 
(>>=) (Just 5) (\x -> Just (x * 2))
-- Just 10
Just 3 >>= (\x -> Just "!" >>= (\y -> Just (show x ++ y)))  
-- Just "3!" stuff like chain

-- do notation

-- bind
foo :: Maybe String  
foo = Just 3   >>= (\x -> 
      Just "!" >>= (\y -> 
      Just (show x ++ y)))

-- do
foo :: Maybe String  
foo = do  
    x <- Just 3  
    y <- Just "!"  
    Just (show x ++ y)

-- pattern matching with do
sayH :: Maybe Char  
sayH = do  
    (x:xs) <- Just "hello"  
    return x
-- If the matching falls through all the patterns for a given function, an error is thrown and our program crashes