# Haskell Chapter 10: Creating Type Classes and Instances

## Haskell Chapter 10 Practical Tasks: Custom Type Classes and Instances

### HC10T1: ShowSimple Type Class
Define a new type class ShowSimple that requires a function showSimple :: a -> String for simple string conversion.
Implement an instance for PaymentMethod type.

### HC10T2: Summable Type Class
Create a type class Summable that provides sumUp :: [a] -> a.
Implement it for the type Int.

### HC10T3: Comparable Type Class
Define a type class Comparable with a function compareWith :: a -> a -> Ordering.
Implement it for Blockchain.

### HC10T4: Eq Instance for Box
Create a parameterized type Box a and make it an instance of Eq.

### HC10T5: ShowDetailed Type Class
Define a type class ShowDetailed with a function showDetailed :: a -> String.
Implement it for a type User.

### HC10T6: Mutual Recursion in Eq for Blockchain
Modify the Eq type class to use mutual recursion between == and /= in an instance for the Blockchain type.

### HC10T7: Convertible Type Class
Create a type class Convertible with convert :: a -> b.
Implement it for converting PaymentMethod to String.

### HC10T8: AdvancedEq Subclass of Eq
Define a subclass AdvancedEq of Eq with an additional method compareEquality :: a -> a -> Bool.

### HC10T9: MinMax Type Class
Implement a type class MinMax with methods minValue :: a and maxValue :: a, and provide instances for Int.

### HC10T10: Concatenatable Type Class
Create a type class Concatenatable with a function concatWith :: a -> a -> a.
Implement it for the type [Char] (String).
Haskell Chapter 11 Practical Tasks: Type Class Applications and Deriving Instances


## Haskell Chapter 10.2 Practical Tasks: Type Class Applications and Deriving Instances
This is the second part of chapter 10. kept the incorrect numbering, to avoid future confusion.

### HC11T1: WeAccept Instance for Box
Create a WeAccept instance for the Box type and write a function that returns a list of accepted boxes.

### HC11T2: Fancy Function for WeAccept
Implement the fancyFunction for the WeAccept type class and test it with various types like Cardano, Cash, and Country.

### HC11T3: Container Type Class for Box
Define a Container type class with the methods isEmpty, contains, and replace, then implement an instance for the Box type.

### HC11T4: Container Instance for Present
Implement the Container type class for the Present type.

### HC11T5: guessWhat'sInside Function for Containers
Create a function guessWhat'sInside that takes a Container and checks if a specific item is inside.

### HC11T6: AdvancedEq for Blockchain
Define a type class AdvancedEq that extends Eq and adds a method compareEquality, then implement it for the Blockchain type.

### HC11T7: Ord Instance for Box
Implement the Ord instance for the Box type using the compare function.

### HC11T8: Deriving Eq and Ord for PaymentMethod
Derive the Eq and Ord instances for the PaymentMethod and test comparisons.

### HC11T9: Data Type Length with Units
Define a new data type Length with constructors M and Km, derive Eq, and manually fix comparisons between meters and kilometers.

### HC11T10: sortContainers Function
Implement a function sortContainers that sorts a list of containers using the derived Ord instance.