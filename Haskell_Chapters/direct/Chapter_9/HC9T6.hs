-- HC9T6.hs : Recursive Tweet Data Type
-- This file defines a recursive data type Tweet with content, likes, and comments.

-- Pure function: Defines the Tweet data type recursively.
data Tweet = Tweet { content :: String, likes :: Int, comments :: [Tweet] }

main :: IO ()
main = do
    let reply = Tweet { content = "Great post!", likes = 5, comments = [] }
    let tweet = Tweet { content = "Hello world!", likes = 10, comments = [reply] }
    putStrLn ("Tweet: " ++ show tweet)
