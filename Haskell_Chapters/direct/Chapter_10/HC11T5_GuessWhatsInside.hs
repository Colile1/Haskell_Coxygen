-- HC11T5.hs : guessWhat'sInside Function
-- This file creates a function to check if an item is inside a Container.

-- Pure function: Defines the Container type class.
class Container c where
    isEmpty :: c a -> Bool
    contains :: Eq a => a -> c a -> Bool
    replace :: a -> c a -> c a

-- Pure function: guessWhat'sInside function.
guessWhat'sInside :: (Container c, Eq a) => a -> c a -> Bool
guessWhat'sInside item container = contains item container

main :: IO ()
main = do
    -- Assuming Box is defined elsewhere
    putStrLn "Function defined"
