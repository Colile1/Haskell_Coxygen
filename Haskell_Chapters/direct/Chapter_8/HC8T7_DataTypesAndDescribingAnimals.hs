-- HC8T7.hs : Data Types and Describing Animals
-- This file defines Animal type and describeAnimal function.

data Animal = Dog String | Cat String | Bird String

describeAnimal :: Animal -> String
describeAnimal (Dog name) = "Dog named " ++ name
describeAnimal (Cat name) = "Cat named " ++ name
describeAnimal (Bird name) = "Bird named " ++ name

dog :: Animal
dog = Dog "Rex"

cat :: Animal
cat = Cat "Whiskers"

bird :: Animal
bird = Bird "Tweety"

main :: IO ()
main = do
    putStrLn "Dog: "
    putStrLn (describeAnimal dog)
    putStrLn "Cat: "
    putStrLn (describeAnimal cat)
    putStrLn "Bird: "
    putStrLn (describeAnimal bird)
