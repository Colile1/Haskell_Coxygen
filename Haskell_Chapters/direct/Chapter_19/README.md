# Applicative Functor - Hakell Practical Tasks
This lesson covers Applicative Functors, which extend Functors by enabling multi-argument function application within a context. They bridge the gap between simple Functors and more powerful abstractions like Monads. By the end, you'll see why Applicatives are essential and how they provide a structured way to work with functions in contexts. ? Key Topics Why Applicative Functors? - Understanding how they solve the limitations of plain Functors. Function application at the Functor level - Using <*> for contextual application. Being pure - Lifting ordinary values into a context with pure.



# Haskell Chapter 19 Practical Tasks: Applicative Functors and Effects
Write code to complete Practical Tasks below.
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

## HC19T-all-test
This file should call all the tasks 1-20 to test them all if they work as intended

# Haskell rules 

- Answer in the most basic way possible using only knowledge learnt in previous chapters i.e when answering questions in chapter three use only knowlegde from chapter 3, 2 and 1, not chapter 4. 

- Use n as a represantation for number. If there are multiple numbers n1, n2, n3, ...etc.
- print output that result in just numbers with a very short description of what the number is should be printed before the number.

- If names are required use South African names. the default name for a male person be Colile, the default name for a place should be Johannesburg. 

file name example HC1T4.hs (which abriviates Haskell Chapter 1 Task 4 )
if I do not state which folder to put the file in, write to 2 versions of the file, 1 into the direct each folder in the relevant chapter folders:

- All files must have a main function, the main function must call the other function but must its self have minimal logic (only the bear neccesary). 
 
## Function and Commenting Rules

When writing Haskell code, follow these rules:

1. **File-Level Commenting**

    * The very first line of the file must be a heading Line comment that contains the full name of the file, and a very short descrip
    * The Second line of the file must be a single comment that briefly describes what the file contains.

2. **Function-Level Commenting**

    * Every function must have a comment directly above it.
    * The comment must begin by stating the function type:

      * `"Pure function:"` if it is pure.
      * `"Input wrapper:"` if it only gathers input and applies a pure function.
      * `"Output logic:"` if it only handles output.
    * After the type label, briefly describe what the function does. Keep it short and clear.
3. **Naming Conventions**

    * Pure functions use descriptive camelCase names (e.g. `makeMessage`).
    * Input wrappers must reuse the exact pure function name with a `get_` prefix (e.g. `get_makeMessage`).
    * Output-handling functions should have names that clearly describe their purpose.
4. **Separation of Concerns**

   * Pure functions must not contain any IO.
   * Input wrappers must only collect input, then return the result of applying the pure function. They should not print or produce output.
   * Only the main function (or designated output logic functions) may print to the console.
5. **Example Structure**

   ```haskell
   -- [file name] : [less than 3 word descriptive heading of file]
   -- This file demonstrates [brief description].

   -- Pure function: [short description].
   pureFunctionName :: <type signature>
   pureFunctionName args = ...

   -- Input wrapper: [short description].
   get_pureFunctionName :: IO <type>
   get_pureFunctionName = do
       ...
       return (pureFunctionName args)
   main :: IO ()
   main = do
       result <- get_pureFunctionName
       putStrLn ("Result: " ++ result)
   ```

Always follow this structure unless explicitly told otherwise.

## Additiional rules folder specific
### In direct folder :

### withExplainations
when writing code into withExplainations folder : 
    - 3rd line must be a general explaination of the code 
    - include line by line comments that explain in detail what each line part is doing and why. If there is alternative ways to do this state the pros and cons of these alternatives.
 

## Wrapping up
when I give a single word command:
```
done
```
this means I am done with the current chapter and you must:
- rename the files in the direct folder chapter to make them easy to see whats the task was not just HCxTy.hs but also a short description of what the file does. e.g HC3T2.hs becomes HC3T2_GradeFromScore.hs
- add log entry into the log.md format: 
``` 
Date: YYYY-MM-DD
Time Spent: [time spent in hours and minutes]

[3 to 5 line description of what was done in the on that day]
```  
