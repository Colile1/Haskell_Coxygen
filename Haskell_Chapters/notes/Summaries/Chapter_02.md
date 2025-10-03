# Chapter 2: Types, Functions, and Lists - Summary

## Key Concepts

### Types and Signatures
- Types label expressions and restrict usage.
- Use `::` to specify type.
- Common types: Int, Integer, Float, Double, Bool, Char, String.
- Function signatures: `func :: ArgType -> ReturnType`.
- Functions can have multiple arguments: `prod :: Int -> Int -> Int`.

### Variables and Definitions
- Variables in Haskell are immutable.
- Definitions bind names to expressions.
- Once bound, value cannot change.

### Infix and Prefix Notations
- Functions can be used in prefix or infix form.
- Operators are functions with symbolic names, used infix.
- Use parentheses to use infix as prefix: `(+) 1 2`.
- Use backticks to use prefix as infix: `4 \`prod\` 5`.

### Common Data Types
- Int: fixed size integer.
- Integer: arbitrary precision integer.
- Float: single precision floating point.
- Double: double precision floating point.
- Bool: True or False.
- Char: Unicode character.
- String: list of Char, syntactic sugar for `[Char]`.

### Polymorphic Types and Type Variables
- Functions can be polymorphic using type variables.
- Example: `first :: (a, b) -> a` works for any types a and b.
- Polymorphic functions work with any type.

### Lists
- Homogeneous collections: all elements same type.
- Denoted by square brackets: `[1,2,3]`.
- Strings are lists of Char.
- Lists can be infinite: `[1..]`.
- Use `take` to get finite prefix.
- Use `:` (cons) to prepend element.
- Use `++` to concatenate lists.
- Use `length`, `null`, `sum`, `elem` for common operations.

### Tuples
- Fixed size heterogeneous collections.
- Denoted by parentheses: `(a, b, c)`.
- Different types and order produce different tuple types.
- No single-element tuples.

## Practical Tips
- Use `:t` in GHCi to check types.
- Use parentheses to switch between infix and prefix.
- Use polymorphic functions for generality.
- Use lists for homogeneous data, tuples for fixed heterogeneous data.

## Quick Revision Tips
- `::` means "has type".
- Variables immutable.
- Infix operators are functions.
- Lists homogeneous, tuples heterogeneous.
- Polymorphic types use lowercase letters.
- Strings are `[Char]`.
- Use `:` to prepend, `++` to concatenate.
- Use `take` to limit infinite lists.
