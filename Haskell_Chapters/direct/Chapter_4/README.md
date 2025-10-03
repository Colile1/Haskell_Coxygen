# Pattern matching and Case expressions

Hakell Practical Tasks
Write code to complete Practical Tasks below. Haskell editor for testing is also found below this page.


## HC4T1 - Task 1: Define a weatherReport Function
Create a function weatherReport :: String -> String that takes a weather condition as a string (e.g., "sunny", "rainy", "cloudy") and returns a message describing the weather.
Use pattern matching to handle the following cases:
"sunny" → "It's a bright and beautiful day!"
"rainy" → "Don't forget your umbrella!"
"cloudy" → "A bit gloomy, but no rain yet!"
Any other input should return "Weather unknown".

## HC4T2 - Task 2: Define a dayType Function
Create a function dayType :: String -> String that determines if a given day of the week is a weekday or weekend.
"Saturday" and "Sunday" → "It's a weekend!"
Any other day of the week → "It's a weekday."
If an invalid day is provided, return "Invalid day".

## HC4T3 - Task 3: Define a gradeComment Function
Write a function gradeComment :: Int -> String that takes a numerical grade and returns a comment based on the grade range:
90 - 100 → "Excellent!"
70 - 89 → "Good job!"
50 - 69 → "You passed."
0 - 49 → "Better luck next time."
Any other number → "Invalid grade".

## HC4T4 - Task 4: Rewrite specialBirthday using Pattern Matching
Rewrite the specialBirthday function using pattern matching instead of if-else statements.

## HC4T5 - Task 5: Add a Catch-All Pattern with a Custom Message
Modify specialBirthday to include the age in the return message when it doesn’t match predefined cases.

## HC4T6 - Task 6: Identify List Contents Using Pattern Matching
Create a function whatsInsideThisList that returns a string based on the number of elements in a list.

## HC4T7 - Task 7: Ignore Elements in a List
Modify firstAndThird to return only the first and third elements of a list, ignoring others.

## HC4T8 - Task 8: Extract Values from Tuples
Create a function describeTuple that extracts values from a tuple and returns a string.