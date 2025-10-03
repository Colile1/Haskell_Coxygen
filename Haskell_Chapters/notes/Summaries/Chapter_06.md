# Chapter 6: Recursion and Folds - Summary

## Key Concepts

### Recursion
- Functions that call themselves to solve smaller instances of a problem.
- Base case to stop recursion.
- Examples: factorial, Fibonacci, list reversal.

### Fold Functions
- foldr: Right-associative fold, processes list from right to left.
- foldl: Left-associative fold, processes list from left to right.
- Used to reduce lists to a single value (sum, product, etc.).

### List Processing with Recursion
- Recursive definitions for common list operations:
  - sum, product, length, map, filter.
- Pattern matching on lists: empty list [] and (x:xs).

### Examples
- Factorial: recursive multiplication down to 1.
- Fibonacci: recursive sum of two previous numbers.
- sumFoldr: sum using foldr.
- productFoldl: product using foldl.
- reverseList: recursive list reversal.
- elementExists: check if element is in list recursively.
- listLength: recursive length calculation.
- filterEven: recursive filtering of even numbers.
- mapRecursive: recursive map implementation.
- digits: recursive extraction of digits from a number.

## Quick Revision Tips
- Understand base case and recursive case.
- Use foldr and foldl for list reductions.
- Practice writing recursive functions for list operations.
- Use pattern matching for elegant recursion.
