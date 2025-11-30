-- HC19T19.hs : Sequence Maybe List
-- This file implements the function sequenceApplicative returning a Maybe [a].

import Control.Applicative

-- Pure function: Custom sequence implementation using foldr and liftA2
sequenceApplicative :: [Maybe a] -> Maybe [a]
sequenceApplicative = foldr (liftA2 (:)) (Just [])

-- Output logic
main :: IO ()
main = do
    let dataList = [Just 10, Just 20, Just 30]
    let result = sequenceApplicative dataList
    putStrLn ("Sequenced Maybe: " ++ show result)
