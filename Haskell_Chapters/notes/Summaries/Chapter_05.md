# Chapter 5: Improving and Combining Functions - Summary

## Key Concepts

### Higher-Order Functions
- Functions that take other functions as arguments or return functions as results.
- Functions are first-class citizens in Haskell.
- Example: `applyTwice f x = f (f x)` - applies function f twice to x.

### Filter Function
- `filter :: (a -> Bool) -> [a] -> [a]`
- Takes a predicate and a list, returns elements that satisfy the predicate.
- Example: `filter even [1..10]` → [2,4,6,8,10]

### Any Function
- `any :: (a -> Bool) -> [a] -> Bool`
- Checks if any element in the list satisfies the predicate.
- Example: `any (>4) [1,2,3,4]` → False

### Lambda Functions
- Anonymous functions: `\x -> expression`
- Useful for one-time use or with higher-order functions.
- Example: `any (\x -> x > 4) [1,2,3,4]` instead of defining a named function.

### Precedence and Associativity
- Operators have precedence (0-9, higher binds tighter).
- Associativity: infixl (left), infixr (right), infix (none).
- Function application has highest precedence (10), left-associative.
- Example: `1 + 2 * 3` = `1 + (2 * 3)` since * > +

### Curried Functions
- All Haskell functions are curried: take one argument, return a function.
- Signature `Int -> Int -> Int` is `Int -> (Int -> Int)`
- Enables partial application.

### Partial Application
- Apply fewer arguments to get a new function.
- Example: `multiplyByFive = (*5)` - partially applies * to 5.

### Sections
- Partial application of infix operators.
- Example: `(>4)` is `\x -> x > 4`, `(+1)` is `\x -> x + 1`

### $ Operator
- `($) :: (a -> b) -> a -> b`, `f $ x = f x`
- Lowest precedence (0), right-associative.
- Avoids parentheses: `f $ g $ h x` = `f (g (h x))`
- Example: `sum $ map (*2) $ filter (>3) [1..10]`

### Function Composition (.)
- `(.) :: (b -> c) -> (a -> b) -> a -> c`, `f . g = \x -> f (g x)`
- Right-associative, high precedence (9).
- Composes functions: output of g is input to f.
- Example: `evenSquares = filter even . map (^2)`

### Point-Free Style
- Define functions without naming arguments.
- Uses composition and partial application.
- Example: `addFive = (+5)` instead of `addFive x = x + 5`

## Practical Tasks Covered
- applyThrice: Apply function three times.
- Filtering odds with filter.
- Checking uppercase starts with any.
- Lambda for biggerThan10.
- Partial application for multiplyByFive.
- Composition for squaresEven.
- Using $ to simplify expressions.
- Point-free addFive.
- Higher-order transformList.
- Combining filter, map, any for hasBigSquare.

## Quick Revision Tips
- Higher-order: Functions as args/results.
- Filter: Keep elements matching predicate.
- Any: True if any matches predicate.
- Lambda: Anonymous \params -> body.
- Currying: All functions take one arg.
- Partial app: Fewer args → new function.
- $: Low prec app, no parens.
- .: Compose f . g = f after g.
- Point-free: No arg names, use ops.
