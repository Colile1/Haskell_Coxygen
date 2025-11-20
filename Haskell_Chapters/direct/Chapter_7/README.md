# Haskell Chapter 7: Intro to Type Classes

Write code to complete Practical Tasks below. Haskell editor for testing is also found below this page.

Haskell Chapter 7 Practical Tasks: Type Classes and Custom Types

## HC7T1: Implement an Eq Instance for a Custom Data Type
Define a data type Color representing Red, Green, and Blue.
Implement the Eq type class for it so that colors of the same type are considered equal.

## HC7T2: Implement an Ord Instance for a Custom Data Type
Using the Color type from 

## HC7T1: implement the Ord type class so that Red < Green < Blue.

## HC7T3: Function Using Multiple Constraints
Write a function compareValues that takes two arguments of type a and returns the larger one.
Ensure that a is both an instance of Eq and Ord.

## HC7T4: Custom Type with Show and Read
Define a data type Shape with constructors Circle Double and Rectangle Double Double.
Implement Show and Read instances for it.

## HC7T5: Function with Num Constraint
Write a function squareArea that calculates the area of a square given its side length.
Ensure that the function works with any numeric type.

## HC7T6: Using Integral and Floating Type Classes
Define a function circleCircumference that takes a radius and returns the circumference.
Ensure it works with both Integral and Floating numbers.

## HC7T7: Bounded and Enum
Create a function nextColor that takes a Color and returns the next color in sequence. If it reaches the last color, it should wrap around.

## HC7T8: Parse a Value from a String Using Read
Write a function parseShape that takes a String and returns a Shape.
The function should return Nothing for invalid inputs.

## HC7T9: Type Class with Multiple Instances
Create a type class Describable with a method describe.
Implement it for Bool and Shape.

## HC7T10: Function with Multiple Type Class Constraints
Write a function describeAndCompare that takes two Describable values and returns the description of the larger one.