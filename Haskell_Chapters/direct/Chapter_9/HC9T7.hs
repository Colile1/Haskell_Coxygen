-- HC9T7.hs : Engagement Function for Tweet
-- This file creates a function to calculate the engagement of a Tweet.

-- Pure function: Calculates engagement by summing likes and engagement of comments.
engagement :: Tweet -> Int
engagement tweet = likes tweet + sum (map engagement (comments tweet))

main :: IO ()
main = do
    let reply = Tweet { content = "Great post!", likes = 5, comments = [] }
    let tweet = Tweet { content = "Hello world!", likes = 10, comments = [reply] }
    putStrLn ("Engagement: " ++ show (engagement tweet))
