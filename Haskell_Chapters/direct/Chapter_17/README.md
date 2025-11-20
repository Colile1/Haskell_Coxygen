# Haskell Chapter 17 Practical Tasks: Semigroups and Monoids

## HC17T1: Severity Data Type and Semigroup Instance
Create a Severity data type representing the severity of an emergency with four levels (Low, Medium, High, Critical).
Implement a Semigroup instance for this type, where the higher severity overrides the lower one.

## HC17T2: Min and Max Newtypes with Semigroup
Define a Min and Max newtype for any Ord type and implement their respective Semigroup instances using min and max.

## HC17T3: Monoid Instance for Severity
Implement the Monoid instance for the Severity type, where the identity value is Low.

## HC17T4: Monoid Instance for Sum Newtype
Implement the Monoid instance for the Sum newtype, where the identity element is 0.

## HC17T5: combineLists Function
Implement a function combineLists that uses the Semigroup instance to concatenate two lists of integers.

## HC17T6: maxSeverity Function
Define a function maxSeverity that combines a list of Severity values using mconcat.

## HC17T7: multiplyProducts Function
Implement a function multiplyProducts that takes a list of Product values and returns the combined result using mconcat.

## HC17T8: foldWithSemigroup Function
Write a function foldWithSemigroup that accepts any list of a type with a Semigroup instance and combines all elements using foldr.

## HC17T9: Config Data Type and Semigroup Instance
Define a Config data type with fields for loggingLevel, timeout, and retries.
Implement a Semigroup instance that combines configurations by taking the maximum loggingLevel and retries and the minimum timeout.

## HC17T10: Monoid Instance for Config
Implement the Monoid instance for the Config data type, where the identity element is a configuration with the lowest loggingLevel, highest timeout, and lowest retries.
