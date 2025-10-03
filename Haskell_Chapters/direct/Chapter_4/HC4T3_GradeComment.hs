-- HC4T3.hs : Grade comment
-- This file contains a function to comment on a grade.

-- Pure function: Comments on a numerical grade.
gradeComment :: Int -> String
gradeComment n
  | n >= 90 && n <= 100 = "Excellent!"
  | n >= 70 && n <= 89 = "Good job!"
  | n >= 50 && n <= 69 = "You passed."
  | n >= 0 && n <= 49 = "Better luck next time."
  | otherwise = "Invalid grade"

main :: IO ()
main = do
    putStrLn ("gradeComment 95: " ++ gradeComment 95)
    putStrLn ("gradeComment 75: " ++ gradeComment 75)
    putStrLn ("gradeComment 55: " ++ gradeComment 55)
    putStrLn ("gradeComment 45: " ++ gradeComment 45)
    putStrLn ("gradeComment 105: " ++ gradeComment 105)
