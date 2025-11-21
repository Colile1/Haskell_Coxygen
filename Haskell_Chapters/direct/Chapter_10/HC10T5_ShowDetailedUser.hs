-- HC10T5.hs : ShowDetailed Type Class
-- This file defines a ShowDetailed type class and implements it for User.

-- Pure function: Defines the User data type.
data User = User String Int deriving Show

-- Pure function: Defines the ShowDetailed type class.
class ShowDetailed a where
    showDetailed :: a -> String

-- Pure function: Implements ShowDetailed for User.
instance ShowDetailed User where
    showDetailed (User name age) = "User: " ++ name ++ ", Age: " ++ show age

main :: IO ()
main = do
    let user = User "Colile" 25
    putStrLn ("Detailed: " ++ showDetailed user)
