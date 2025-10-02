# Conditions and helper constructions

Hakell Practical Tasks
Write code to complete Practical Tasks below. Haskell editor for testing is also found below this page.

## HC3T1 - Task 1: Check if a number is positive, negative, or zero
Define a function checkNumber :: Int -> String.
Use an if-then-else statement to check if the number is positive, negative, or zero.
Return "Positive", "Negative", or "Zero" accordingly.
Test your function with checkNumber 5, checkNumber (-3), and checkNumber 0.

## HC3T2 - Task 2: Determine the grade based on a score using guards
Define a function grade :: Int -> String.
Use guards (|) to classify scores into grades:
90 and above: "A"
80 to 89: "B"
70 to 79: "C"
60 to 69: "D"
Below 60: "F"
Test your function with grade 95, grade 72, and grade 50.

## HC3T3 - Task 3: Convert an RGB color to a hex string using let bindings
Define a function rgbToHex :: (Int, Int, Int) -> String.
Use let bindings to format each color component as a two-character hex string.
Concatenate the three hex values into a single string.
Test your function with rgbToHex (255, 0, 127) and rgbToHex (0, 255, 64).

## HC3T4 - Task 4: Calculate the area of a triangle using Heron's formula
Define a function triangleArea :: Float -> Float -> Float -> Float.
Use let to calculate the semi-perimeter s.
Apply Heron’s formula: sqrt(s * (s - a) * (s - b) * (s - c)).
Test with triangleArea 3 4 5 and triangleArea 7 8 9.

## HC3T5 - Task 5: Determine the type of a triangle using guards
Define a function triangleType :: Float -> Float -> Float -> String.
Use guards to classify the triangle:
All sides equal: "Equilateral"
Two sides equal: "Isosceles"
No sides equal: "Scalene"
Test with triangleType 3 3 3, triangleType 5 5 8, and triangleType 6 7 8.

## HC3T6 - Advanced Task 6: Check leap year using if-then-else
Define isLeapYear :: Int -> Bool.
Use if-then-else to check:
Divisible by 400: True
Divisible by 100 but not 400: False
Divisible by 4: True
Otherwise: False
Test with isLeapYear 2000, isLeapYear 1900, and isLeapYear 2024.

## HC3T7 - Advanced Task 7: Determine the season based on the month using guards
Define season :: Int -> String.
Use guards to return:
12, 1, 2 → "Winter"
3, 4, 5 → "Spring"
6, 7, 8 → "Summer"
9, 10, 11 → "Autumn"
Test with season 3, season 7, and season 11.

## HC3T8 - Advanced Task 8: Calculate BMI and return category using where
Define bmiCategory :: Float -> Float -> String.
Use where to calculate BMI: bmi = weight / height^2.
Use guards to classify BMI:
<18.5: "Underweight"
18.5 to 24.9: "Normal"
25 to 29.9: "Overweight"
≥30: "Obese"
Test with bmiCategory 70 1.75 and bmiCategory 90 1.8.

## HC3T9 - Advanced Task 9: Find the maximum of three numbers using let
Define maxOfThree :: Int -> Int -> Int -> Int.
Use let to store intermediate max values.
Return the maximum of the three numbers.
Test with maxOfThree 10 20 15 and maxOfThree 5 25 10.

## HC3T10 - Advanced Task 10: Check if a string is a palindrome using recursion and guards
Define isPalindrome :: String -> Bool.
Use guards:
If the string has 0 or 1 characters: True
If the first and last characters match, recursively check the rest.
Otherwise, return False.
Test with isPalindrome "racecar", isPalindrome "haskell", and isPalindrome "madam".

