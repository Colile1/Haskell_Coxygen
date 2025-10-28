# Haskell Chapter8: Creating Non-parameterized Types

Hakell Practical Tasks
Write code to complete Practical Tasks below. Haskell editor for testing is also found below this page.

Haskell Chapter 8 Practical Tasks: Data Types, Synonyms, and Records

## HC8T1: Type Synonyms and Basic Function
Create a type synonym called Address for String and a type synonym called Value for Int.
Define a function generateTx :: Address -> Address -> Value -> String that takes two addresses and a value and returns a string concatenating these.

## HC8T2: New Types and Data Constructors
Define a new type PaymentMethod with the constructors Cash, Card, and Cryptocurrency.
Create a Person type that includes a name, address (tuple of String and Int), and a payment method.
Create a person bob who pays with cash.

## HC8T3: Algebraic Data Types and Functions
Define a type Shape with constructors Circle Float and Rectangle Float Float.
Create a function area :: Shape -> Float that calculates the area of the shape.
Calculate the area of a circle with radius 5 and a rectangle with sides 10 and 5.

## HC8T4: Record Syntax for Employee
Define a new type Employee using record syntax with fields name :: String and experienceInYears :: Float.
Create an employee richard with 7.5 years of experience.

## HC8T5: Record Syntax for Person
Define a type Person using record syntax that includes name :: String, age :: Int, and isEmployed :: Bool.
Create a person1 who is employed, and a person2 who is unemployed.

## HC8T6: Record Syntax for Shape Variants
Define a type Shape using record syntax with fields center :: (Float, Float), color :: String, and radius :: Float for circles, and width :: Float, height :: Float, and color :: String for rectangles.
Create an instance of Shape for a circle and a rectangle.

## HC8T7: Data Types and Describing Animals
Define a new type Animal using data with constructors Dog String and Cat String.
Create a function describeAnimal :: Animal -> String that describes the animal.
Create instances for a dog and a cat.

## HC8T8: Type Synonyms and Greeting Function
Using type synonyms, create a type synonym Name for String and a type synonym Age for Int.
Define a function greet :: Name -> Age -> String that takes a name and age and returns a greeting.

## HC8T9: Record Type and Transaction Function
Define a type Transaction with fields from :: Address, to :: Address, amount :: Value, and transactionId :: String.
Define a function createTransaction :: Address -> Address -> Value -> String that creates a Transaction and returns the transaction id.

## HC8T10: Deriving Show for Book
Using deriving Show, define a type Book with fields title :: String, author :: String, and year :: Int.
Create a Book instance for a book and print it using the Show instance.