-- HC10T1_GuessingGame: Guessing Game
-- This file implements a number guessing game where the user guesses a secret number.

-- Pure function: Compares the user's guess with the secret number and returns feedback.
checkGuess :: Int -> Int -> String
checkGuess guess secret
  | guess == secret = "Correct!"
  | guess > secret = "Too high!"
  | otherwise = "Too low!"

-- Input wrapper: Reads the user's guess from input.
getGuess :: IO Int
getGuess = do
  putStr "Enter your guess: "
  input <- getLine
  return (read input :: Int)

-- Output logic: Main function that generates a secret number and runs the guessing loop.
main :: IO ()
main = do
  secret <- 4
  putStrLn "Guess the number between 1 and 100!"
  gameLoop secret

-- Pure function: Recursive loop for the game, continues until the guess is correct.
gameLoop :: Int -> IO ()
gameLoop secret = do
  guess <- getGuess
  let feedback = checkGuess guess secret
  putStrLn feedback
  if guess == secret
    then return ()
    else gameLoop secret
