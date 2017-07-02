--- simple list defenition in haskel

data List a = Nil | Const a (List a) deriving Show

len                 ::  List a -> Int
len Nil             =   0
len (Const _ xs)    =   1 + len xs

myList = Const 1 (Const 2 (Const 3 Nil))

head'            ::  [a] -> a
head'  (x:_)     =   x
head'  []        =   error "head error: empty list"
