Haskell Chapter 18 Practical Tasks: Functors and fmap

# HC18T1: mapToLower Function with fmap
Define a function mapToLower using fmap that converts all characters in a list to lowercase.

# HC18T2: Functor Instance for Tree
Create a Functor instance for the binary tree type Tree.

# HC18T3: incrementTreeValues Function
Define a function incrementTreeValues that adds one to every value in a tree using the Functor instance.

# HC18T4: mapToBits Function
Implement a function mapToBits to convert a list of Booleans to characters '1' or '0' using fmap.

# HC18T5: Functor Instance for Either
Define a Functor instance for the Either type, applying fmap only to the Right case.

# HC18T6: applyToMaybe Function
Implement a function applyToMaybe that uses fmap to transform the value inside a Maybe.

# HC18T7: fmapTuple Function
Define a function fmapTuple that applies a function to the second element of a tuple (a, b) using the Functor instance of (,) a.

# HC18T8: identityLawCheck Function
Implement the identityLawCheck function to verify the Functor identity law.

# HC18T9: compositionLawCheck Function
Implement the compositionLawCheck function to verify the Functor composition law.

# HC18T10: nestedFmap Function
Create a function nestedFmap that applies a function to a nested structure using multiple fmap calls.