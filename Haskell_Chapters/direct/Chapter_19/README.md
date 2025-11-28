# Applicative Functor - Hakell Practical Tasks
Write code to complete Practical Tasks below. Haskell editor for testing is also found below this page.

# Haskell Chapter 19 Practical Tasks: Applicative Functors and Effects

##  HC19T1: Applicative Instance for Pair
Define an Applicative instance for a custom data type Pair a.

##  HC19T2: addThreeApplicative Function
Implement a function addThreeApplicative that adds three Maybe Int values using applicative style.

##  HC19T3: safeProduct for Maybe Int
Define a function safeProduct that calculates the product of a list of Maybe Int values, returning Nothing if any value is Nothing.

##  HC19T4: liftAndMultiply with liftA2
Create a function liftAndMultiply that lifts a binary function (Int -> Int -> Int) using liftA2.

##  HC19T5: applyEffects with <*>
Implement the function applyEffects using <*>, where it takes a tuple (IO Int, IO Int) and sums the values while printing them.

##  HC19T6: repeatEffect with forever
Define the function repeatEffect that repeatedly executes an effect using forever.

##  HC19T7: conditionalPrint with when
Write a function conditionalPrint using when that prints a message only when a given condition is true.

##  HC19T8: discardSecond with <*
Implement a custom function discardSecond that uses the <* operator to return the first argument after sequencing effects.

##  HC19T9: pureAndApply Demonstration
Implement pureAndApply which demonstrates how pure works with applicative effects.

##  HC19T10: combineResults for Either
Create a function combineResults that combines two Either values using applicative style.

##  HC19T11: Applicative Instance for Wrapper
Define an Applicative instance for a custom data type Wrapper a.

##  HC19T12: sumThreeApplicative for Either String Int
Implement a function sumThreeApplicative that adds three Either String Int values using applicative style.

##  HC19T13: whenApplicative Function
Implement the whenApplicative function that executes an action conditionally when a Bool is true.

##  HC19T14: replicateEffect with replicateM
Define a function replicateEffect that replicates a given IO action a specified number of times using replicateM.

##  HC19T15: sequenceEffects for Applicative List
Create a function sequenceEffects that combines a list of applicative effects into a single effect.

##  HC19T16: applyWithEffects and <*>
Implement applyWithEffects to show how the <*> operator sequences two effects.

##  HC19T17: simulateMaybeEffect for Multiple Maybe
Implement a function simulateMaybeEffect that applies a function to multiple Maybe values using applicative style.

##  HC19T18: combineEitherResults with Multiple Either
Define a function combineEitherResults that handles multiple Either computations with potential errors.

##  HC19T19: sequenceApplicative for Maybe List
Implement the function sequenceApplicative, combining a list of Maybe values and returning a Maybe [a].

##  HC19T20: replicateForever with forever
Implement a function replicateForever that applies an IO action infinitely using forever.