# Chapter 3: Conditions and Helper Constructions - Summary

## Key Concepts

### If-Then-Else Expressions
- if condition then expression1 else expression2
- Else is mandatory; both branches must return same type.
- Example: checkLocalhost ip = if ip == "127.0.0.1" then "It's localhost!" else "No"

### Guards
- Alternative to nested if-else: func arg | cond1 = res1 | cond2 = res2 | otherwise = res3
- otherwise = True, used as catch-all.
- No = after func arg.
- Example: specialBirthday age | age == 1 = "First!" | otherwise = "Nothing"

### Let Expressions
- Bind local variables: let bind1; bind2 in expression
- Bindings accessible in in expression.
- Used for intermediate computations.
- Example: hotterInKelvin c f = let fToC = (f-32)*5/9 in if c > fToC then c+273 else fToC+273

### Where Clauses
- Bind variables after expression: expression where bind1; bind2
- Bindings accessible in entire function body, including guards.
- Example: analyzeCylinder d h | volume < 10 = "glass" where volume = pi*d^2*h/4

### Let vs Where
- Let: Introduces expression, can be used anywhere expression is allowed.
- Where: Declarations bound to syntactic construct (e.g., function body).
- Use let for complex expressions, where for multiple guards.

### Scope
- Where bindings: Only in function body.
- Let bindings: Only within let expression.

## Practical Tasks Covered
- checkNumber: If-then-else for positive/negative/zero.
- grade: Guards for score grading.
- rgbToHex: Let for hex formatting.
- triangleArea: Let for semi-perimeter and Heron's formula.
- triangleType: Guards for equilateral/isosceles/scalene.
- isLeapYear: If-then-else for leap year rules.
- season: Guards for month to season.
- bmiCategory: Where for BMI calculation and guards.
- maxOfThree: Let for intermediate max.
- isPalindrome: Recursion with guards.

## Quick Revision Tips
- If: Always else, same type.
- Guards: | cond = res, otherwise last.
- Let: let binds in exp
- Where: exp where binds
- Let: expressions, Where: guards.
- Scope: Where in body, Let in let.
