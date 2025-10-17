-- HC7T7.hs : Next Color Function
-- This file implements Bounded and Enum for Color and writes nextColor function.

-- Pure function: Defines the Color data type.
data Color = Red | Green | Blue deriving (Eq, Ord, Show, Read)

-- Pure function: Implements Bounded for Color.
instance Bounded Color where
    minBound = Red
    maxBound = Blue

-- Pure function: Implements Enum for Color.
instance Enum Color where
    toEnum 0 = Red
    toEnum 1 = Green
    toEnum 2 = Blue
    fromEnum Red = 0
    fromEnum Green = 1
    fromEnum Blue = 2

-- Pure function: Gets the next color, wrapping around.
nextColor :: Color -> Color
nextColor Blue = Red
nextColor c = succ c

-- Input wrapper: Gets a color from input.
get_nextColor :: IO Color
get_nextColor = do
    putStrLn "Enter color (Red, Green, Blue):"
    c <- readLn
    return (nextColor c)

-- Output logic: Prints the next color.
main :: IO ()
main = do
    next <- get_nextColor
    putStrLn "Next color: "
    putStrLn (show next)
