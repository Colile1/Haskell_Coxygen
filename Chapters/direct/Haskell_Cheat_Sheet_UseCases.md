# Haskell Cheat Sheet with Use Cases and Examples

## Function Composition
Use case: Combining multiple functions into a single operation, like doubling a number and then incrementing it.

```haskell
double :: Int -> Int
double n = 2*n

increment :: Int -> Int
increment n = n + 1

doubleThenIncrement :: Int -> Int
doubleThenIncrement = increment . double

main :: IO ()
main = print (doubleThenIncrement 7)
```

## Pure Functions
Use case: Calculating the area of a circle given its radius, demonstrating a pure function with no side effects.

```haskell
circleArea :: Double -> Double
circleArea r = pi * r * r

main :: IO ()
main = print (circleArea 12.0)
```

## Conditional Checks
Use case: Checking if a number is greater than 18, useful for age verification or threshold comparisons.

```haskell
greaterThan18 :: Int -> Bool
greaterThan18 n = n > 18

main :: IO ()
main = do
  print (greaterThan18 12)
  print (greaterThan18 19)
```

## Data Processing with Lists
Use case: Processing player data to get the top three players by score, demonstrating list operations and sorting.

```haskell
import Data.List (sortBy)
import Data.Function (on)

extractPlayers :: [(String, Int)] -> [String]
extractPlayers = map fst

sortByScore :: [(String, Int)] -> [(String, Int)]
sortByScore = sortBy (flip compare `on` snd)

topThree :: [a] -> [a]
topThree = take 3

getTopThreePlayers :: [(String, Int)] -> [String]
getTopThreePlayers = extractPlayers . topThree . sortByScore

main :: IO ()
main = print (getTopThreePlayers [
    ("Colile", 20),
    ("Sabelo", 12),
    ("Themba", 16),
    ("Cirie", 10),
    ("Anele", 8),
    ("Zinhle", 14)
    ])
```

## Type Classes
Use case: Defining a custom type class for simple string conversion of payment methods, allowing polymorphic behavior.

```haskell
data PaymentMethod = Cardano | Cash | Country

class ShowSimple a where
    showSimple :: a -> String

instance ShowSimple PaymentMethod where
    showSimple Cardano = "Cardano"
    showSimple Cash = "Cash"
    showSimple Country = "Country"

main :: IO ()
main = print (showSimple Cardano)
```

## Arithmetic Operations
Use case: Adding two numbers, a basic operation for calculations in various applications.

```haskell
addTwoNumbers :: Int -> Int -> Int
addTwoNumbers n1 n2 = n1 + n2

main :: IO ()
main = print (addTwoNumbers 12 6)
