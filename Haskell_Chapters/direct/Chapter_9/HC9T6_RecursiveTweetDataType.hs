-- HC9T6.hs : Recursive Data Type for Tweets
-- This file defines a recursive data type Tweet.

-- Pure function: Defines the Tweet data type.
data Tweet = Tweet { content :: String, likes :: Int, comments :: [Tweet] }

-- Pure function: Defines the Show instance for Tweet.
instance Show Tweet where
    show (Tweet c l cs) = "Tweet {content = " ++ show c ++ ", likes = " ++ show l ++ ", comments = " ++ show cs ++ "}"

main :: IO ()
main = do
    let tweet = Tweet { content = "Hello", likes = 0, comments = [] }
    putStrLn ("Tweet: " ++ show tweet)
