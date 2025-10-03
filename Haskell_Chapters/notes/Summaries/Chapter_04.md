# Chapter 4: Pattern Matching and Case Expressions - Summary

## Key Concepts

### Pattern Matching
- Act of matching data against patterns, optionally binding variables.
- Used in function definitions, lists, tuples.
- Multiple function definitions for different patterns.

### Pattern Matching in Functions
- Define function multiple times with different parameter patterns.
- Example: specialBirthday 1 = "First birthday!", specialBirthday age = "Nothing special"
- Order matters: matches from top to bottom.
- Catch-all patterns: bind unmatched values to variables.

### Lists and Pattern Matching
- Lists are cons: [1,2,3] = 1:2:3:[]
- Patterns: [] (empty), [x] (single), [x,y] (two), (x:y:z:[]) (three), (x:rest) (any non-empty)
- Ignore elements with _: (x:_:z:_)

### Tuples and Pattern Matching
- Extract elements directly: firstOfThree (x,_,_) = x
- Bind specific positions, ignore others.

### Case Expressions
- case exp of pat1 -> res1; pat2 -> res2; ...
- More expressive than function pattern matching.
- Can be used anywhere as an expression.
- Equivalent to pattern matching in functions.

### Declaration Style vs Expression Style
- Declaration: equations with where, guards, pattern matching in definitions.
- Expression: compose expressions with let, if, lambda, case.
- Haskell supports both; choose based on preference.

## Practical Tasks Covered
- weatherReport: Pattern match strings for weather messages.
- dayType: Classify days as weekday/weekend.
- gradeComment: Use guards in pattern matching for grades.
- specialBirthday: Exact matches and catch-all.
- specialBirthday with age: Bind age in catch-all.
- whatsInsideThisList: Pattern match list structures.
- firstAndThird: Ignore middle elements.
- describeTuple: Match tuple values.

## Quick Revision Tips
- Pattern matching: Multiple defs for patterns.
- Catch-all: Last pattern with variable.
- Lists: [] , [x], x:xs
- Tuples: (a,b,c) patterns.
- Case: case of pat -> res
- Declaration: Equations.
- Expression: Compose expressions.
