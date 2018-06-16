{-# LANGUAGE RankNTypes #-}

{--
enspired from Mark Karpov explanation twitter @mrkkrp

forall (to control polymorphism by context):

1) It's universal quantification. When an expression with type prefixed with forall is used,
type variables must be instantiated to something (or unified with other type variables from context),
so we go from polymorphic things (work "forall" type vars) to concrete types.

2) All polymorphic type signatures have implicit forall at the beginning.
By adding an addition forall "wrapper" (rank n types) you can sort of avoid
instantiation/unification of the quantified variable
and it'll still be polymorphic until you use it in a concrete context.

--}

{-- simple example --}
lengthToTuple length (['bla'], [1, 2, 3])

{-- quantifier applies f as same type, that's cause of an error --}
lengthToTuple :: forall a b c. ([a] -> Int) -> ([b], [c]) -> (Int, Int);
lengthToTuple f (x,y) = (f x, f y)

{-- quantifier applies f as own type related to context, compiled :) --}
lengthToTuple :: forall b c. (forall a. [a] -> Int) -> ([b], [c]) -> (Int, Int);
lengthToTuple f (x,y) = (f x, f y)
