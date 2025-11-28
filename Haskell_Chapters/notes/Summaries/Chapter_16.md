# Haskell Chapter 16: Fundamental Functions

## Key Concepts
- **String Manipulation**: Functions to reverse, check palindromes, convert case, and count character frequencies.
- **Recursion**: Implementing factorial, Fibonacci sequence, and sorting algorithms recursively.
- **List Operations**: Filtering elements, checking existence, removing duplicates, and sorting.
- **Sorting Algorithms**: Insertion sort as an example of recursive sorting.

## Common Functions Covered
- **reverse**: Reverses a string or list.
- **Palindrome Check**: Compares string with its reverse.
- **Factorial**: Recursive calculation of factorial.
- **Filter Even**: Uses `filter` to select even numbers.
- **Uppercase**: Applies `toUpper` to each character.
- **Fibonacci**: Recursive nth Fibonacci number.
- **Element Existence**: Uses `elem` to check membership.
- **Insertion Sort**: Recursive sorting by inserting elements.
- **Remove Duplicates**: Uses `nub` from Data.List.
- **Character Frequency**: Counts occurrences using Map.

## Recursion Patterns
- Base cases for termination (e.g., factorial 0 = 1).
- Recursive calls with reduced arguments.
- Accumulating results through recursion.

## List Processing
- Higher-order functions like `map`, `filter`, `fold`.
- List comprehensions for concise operations.
- Handling empty lists and edge cases.

## Benefits
- Builds foundation for functional programming.
- Demonstrates pure functions and immutability.
- Prepares for more advanced algorithms and data structures.
