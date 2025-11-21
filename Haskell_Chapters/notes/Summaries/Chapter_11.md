# Chapter 11: Basic I/O

## Overview
Chapter 11 introduces basic input/output operations in Haskell, focusing on simple console-based programs. It covers reading from and writing to the console, handling user input, and performing basic computations with I/O.

This topic introduces Basic I/O in Haskell, a language primarily centered around pure functions. It begins by contrasting pure functions with IO actions, which allow interaction with the outside world while maintaining Haskell’s functional nature. The inner workings of IO actions are explored, followed by practical usage, including how Haskell handles side effects. The () type is introduced as a placeholder for actions that don’t return meaningful values. Developers learn to interact with users through fundamental functions like getChar, getLine, and putStrLn. Since actions are first-class values, they can be manipulated like other functions. The lesson then covers composing IO actions using the >> and >>= operators, which help sequence operations. The do block is introduced as a way to write readable, imperative-style IO code, including using let, nesting do-blocks, escaping IO, and the return function to integrate IO with pure functions. Finally, the concept of the main action is explained as the entry point of Haskell programs, followed by a recap of key takeaways. By mastering these concepts, developers can effectively handle user input and output while keeping their code structured and idiomatic.

## Key Concepts

### I/O in Haskell
- Haskell uses the `IO` monad for input/output operations.
- Pure functions remain pure; I/O is handled separately.
- Main function has type `IO ()`.

### Basic I/O Functions
- `putStrLn :: String -> IO ()`: Prints a string followed by a newline.
- `getLine :: IO String`: Reads a line from standard input.
- `read :: Read a => String -> a`: Converts a string to a value of type `a`.
- `show :: Show a => a -> String`: Converts a value to a string.

### Separation of Concerns
- Pure functions handle logic.
- Input wrappers handle input and call pure functions.
- Main handles output.

## Summary
Chapter 11 teaches how to interact with users through the console, maintaining purity in logic while using IO for side effects. This is foundational for more complex I/O in later chapters.
