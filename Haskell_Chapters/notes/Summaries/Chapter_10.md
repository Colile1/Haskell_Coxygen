# Chapter 10 Summary

## Key Concepts
- **Type Classes**: Define interfaces for types to implement, enabling ad-hoc polymorphism.
- **Instances**: Specific implementations of type classes for data types.
- **Subclasses**: Type classes that inherit from others, requiring parent class implementation.
- **Mutual Recursion**: Defining methods in terms of each other within instances.
- **Deriving**: Automatic generation of instances for standard type classes like Eq, Ord, Show.
- **Multi-Parameter Type Classes**: Type classes with multiple type parameters for conversions or relations.

## Important Points
- Type classes allow defining behavior separately from data structures.
- Instances must satisfy all constraints of the type class.
- Subclasses enforce dependencies, ensuring parent behavior is available.
- Mutual recursion can simplify implementation by reusing logic.
- Deriving saves effort for common behaviors but may not cover custom logic.

## Examples
- Custom type classes like Summable, Comparable, ShowSimple, ShowDetailed.
- Instances for parameterized types like Box a.
- Subclass AdvancedEq extending Eq with additional methods.
- Convertible for type conversions, e.g., PaymentMethod to String.
- Container type class with methods like isEmpty, contains, replace.
- Eq for Length with unit conversions (M and Km).

## Exercises
- Implemented Eq with mutual recursion for Blockchain.
- Created Ord instance for Box using compare.
- Defined WeAccept type class and instances for Box and PaymentMethod.
- Built Container instances for Box and Present.
- Wrote guessWhat'sInside function using Container.
- Derived Eq and Ord for PaymentMethod.
- Handled Length equality across units.
- Sorted containers using Ord.
