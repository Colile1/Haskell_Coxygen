# Haskell Chapter 7: Intro to Type Classes

## Key Concepts
- **Type Classes**: Provide ad-hoc polymorphism, allowing restricted polymorphic types with safety. Types join "clubs" with specific behaviors (functions).
- **Class Constraints**: Use `=>` to limit polymorphic types to instances of type classes, e.g., `Eq a => a -> a -> Bool`.

## Common Type Classes
- **Eq**: Equality checks (`==`, `/=`). Instances: Bool, Int, Char, etc. (not functions).
- **Ord**: Ordering (`<`, `>`, `min`, `max`, `compare`). Requires Eq as superclass. Returns Ordering (LT, EQ, GT).
- **Num**: Basic arithmetic (`+`, `-`, `*`). Instances: Int, Integer, Float, Double.
- **Integral**: Whole numbers (`div`). Subclass of Num. Instances: Int, Integer.
- **Fractional**: Fractional numbers (`/`). Subclass of Num. Instances: Float, Double.
- **Show**: Convert to string (`show`). Useful for debugging.
- **Read**: Parse from string (`read`). Can throw exceptions on invalid input.

## Type Inference
- Compiler infers most general valid type, e.g., `fToC x = (x - 32)*5/9` → `Fractional a => a -> a`.

## Multiple Constraints
- Same variable: `(Eq a, Num a) => a -> a`.
- Different variables: `(Ord a, Num b) => a -> a -> b`.

## Benefits
- Balances flexibility (polymorphism) and safety (type restrictions).
- Prevents invalid operations, e.g., adding chars or comparing functions.
