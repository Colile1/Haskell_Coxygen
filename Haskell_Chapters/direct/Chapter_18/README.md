
# Functors and fmap

This lesson dives into Functors, a fundamental abstraction in Haskell. If you've ever used map, you've already worked with Functors! By the end, you'll understand Functors conceptually and know how to use them effectively. ? Key Topics Generalizing map - Functors let you apply functions inside various structures. The Functor type class - Defines fmap and <$>. Defining Functor instances - How to make your custom types functorial. Unexpected Functor instances - Examples include Either a, (,) a, and (->) r. Lifting functions - Applying ordinary functions to values inside contexts.

# Haskell Chapter 18 Practical Tasks: 
## HC18T1: mapToLower Function with fmap
Define a function mapToLower using fmap that converts all characters in a list to lowercase.


## HC18T2: Functor Instance for Tree
Create a Functor instance for the binary tree type Tree.


## HC18T3: incrementTreeValues Function
Define a function incrementTreeValues that adds one to every value in a tree using the Functor instance.


## HC18T4: mapToBits Function
Implement a function mapToBits to convert a list of Booleans to characters '1' or '0' using fmap.


## HC18T5: Functor Instance for Either
Define a Functor instance for the Either type, applying fmap only to the Right case.


## HC18T6: applyToMaybe Function
Implement a function applyToMaybe that uses fmap to transform the value inside a Maybe.


## HC18T7: fmapTuple Function
Define a function fmapTuple that applies a function to the second element of a tuple (a, b) using the Functor instance of (,) a.


## HC18T8: identityLawCheck Function
Implement the identityLawCheck function to verify the Functor identity law.


## HC18T9: compositionLawCheck Function
Implement the compositionLawCheck function to verify the Functor composition law.


## HC18T10: nestedFmap Function
Create a function nestedFmap that applies a function to a nested structure using multiple fmap calls.