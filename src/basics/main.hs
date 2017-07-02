--- simple list defenition in haskel
-- List a
data List a = Nil | Const a (List a) deriving Show
-- similar to:
-- data [] a = [] | a : ([] a)
-- or:
-- data [] a = [] | a : [a]

len                 ::  List a -> Int
len Nil             =   0
len (Const _ xs)    =   1 + len xs

len'                ::  [a] -> Int
len' []             =   0
len' (x: xs)    =   1 + len' xs

head'            ::  [a] -> a
head'  (x:_)     =   x
head'  []        =   error "head error: empty list"

myList = Const 1 (Const 2 (Const 3 Nil))
myAnotherList = 'a': ('b': ('c': []))
