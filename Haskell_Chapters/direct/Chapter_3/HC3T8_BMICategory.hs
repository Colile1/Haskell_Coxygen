-- HC3T8.hs : Calculate BMI category
-- This file contains a function to calculate BMI and return the category using where and guards.

-- Pure function: Calculates BMI and returns the category using where and guards.
bmiCategory :: Float -> Float -> String
bmiCategory weight height = let bmi = weight / (height ^ 2)
                            in if bmi < 18.5 then "Underweight"
                               else if bmi <= 24.9 then "Normal"
                               else if bmi <= 29.9 then "Overweight"
                               else "Obese"

main :: IO ()
main = do
    putStrLn ("bmiCategory 70 1.75: " ++ bmiCategory 70 1.75)
    putStrLn ("bmiCategory 90 1.8: " ++ bmiCategory 90 1.8)
