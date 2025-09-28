# Haskell Cheat Sheet

## Symbols
- `::`  — Type declaration (e.g., `x :: Int`)
- `->`  — Function type (e.g., `f :: Int -> Bool`)
- `=>`  — Type constraints (e.g., `(Eq a) => a -> a -> Bool`)
- `.`   — Function composition (`(f . g) x = f (g x)`)
- `$`   — Function application (low precedence)
- `++`  — List concatenation
- `:`   — Cons operator (prepend to list)
- `!!`  — List indexing (`xs !! 0`)
- `<-`  — Extract value inside monad (used in `do` notation)
- `>>=` — Bind operator (monadic chaining)
- `\`  — Lambda function (anonymous function)
- `_`   — Wildcard (ignore value)
- `::`  — As-patterns (`x@xs` matches whole and part)

---

## Common Built-in Functions
- `map f xs` — Apply `f` to every element in list
- `filter p xs` — Keep elements satisfying predicate `p`
- `foldl f z xs` — Left fold
- `foldr f z xs` — Right fold
- `sum xs` — Sum of list
- `product xs` — Product of list
- `length xs` — Length of list
- `head xs` — First element
- `tail xs` — All but first element
- `last xs` — Last element
- `init xs` — All but last element
- `null xs` — Check if empty
- `reverse xs` — Reverse list
- `take n xs` — First `n` elements
- `drop n xs` — Remove first `n` elements
- `elem x xs` — Membership test
- `zip xs ys` — Pair up elements
- `zipWith f xs ys` — Apply function to pairs
- `unzip zs` — Split list of pairs
- `lines str` — Split string by lines
- `words str` — Split string by spaces
- `unlines` / `unwords` — Join with newlines/spaces

---

## Data Types
### Basic Types
- `Int` — Fixed-precision integer
- `Integer` — Arbitrary-precision integer
- `Float` — Single-precision floating point
- `Double` — Double-precision floating point
- `Bool` — Boolean (`True` or `False`)
- `Char` — Single character (`'a'`)
- `String` — List of characters (`"hello"`)

### Compound Types
- **Lists** — `[1,2,3]`
- **Tuples** — `(1, "hi", True)`
- **Maybe** — `Just a | Nothing`
- **Either** — `Left a | Right b`

### Type Classes
- `Eq` — Equality (`==`, `/=`)
- `Ord` — Ordering (`<`, `>`, `<=`, `>=`)
- `Show` — Convert to string (`show`)
- `Read` — Parse from string (`read`)
- `Enum` — Sequentially ordered types (`succ`, `pred`)
- `Bounded` — Have min/max values (`minBound`, `maxBound`)
- `Num` — Numeric types
- `Integral` — Integral types (`Int`, `Integer`)
- `Fractional` — Fractional types (`Float`, `Double`)

---

## Function Definitions
```haskell
-- Named function
double x = x * 2

-- Lambda (anonymous function)
\x -> x * 2

-- Pattern matching
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Guards
absVal x
  | x < 0     = -x
  | otherwise = x
```

---

## Useful Features
### List Comprehensions
```haskell
[x*2 | x <- [1..10], even x]
```

### Do Notation (Monads)
```haskell
main = do
  putStrLn "Enter your name:"
  name <- getLine
  putStrLn ("Hello, " ++ name)
```

### Custom Data Types
```haskell
data Shape = Circle Float | Rectangle Float Float

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rectangle w h) = w * h
```

---

## Other Relevant Types & Concepts
- **IO** — Side-effecting computations (`IO String`, `IO ()`)
- **Functor** — `fmap :: (a -> b) -> f a -> f b`
- **Applicative** — `<*> :: f (a -> b) -> f a -> f b`
- **Monad** — `>>= :: m a -> (a -> m b) -> m b`
- **Type Aliases** — `type String = [Char]`
- **Newtype** — Lightweight wrapper for type safety
