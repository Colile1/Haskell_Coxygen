----------------
-- Creating Semigroups with records
----------------

data Votes = Votes
  { yesVotes :: Int
  , noVotes  :: Int
  } deriving (Show)

addYesVote :: Votes -> Votes
addYesVote (Votes y n) = Votes (y + 1) n

addNoVote :: Votes -> Votes
addNoVote (Votes y n) = Votes y (n + 1)

combineVotes :: Votes -> Votes -> Votes
combineVotes (Votes y1 n1) (Votes y2 n2) = Votes (y1 + y2) (n1 + n2)

showResults :: Votes -> IO ()
showResults (Votes y n) do =
  putStrLn ("Total YES votes: " ++ show y)
  putStrLn ("Total NO votes: " ++ show n)

getVotes :: IO Votes
getVotes do =
  putStrLn "Enter number of YES votes:"
  yInput <- getLine
  putStrLn "Enter number of NO votes:"
  nInput <- getLine
  let y = read yInput :: Int
  let n = read nInput :: Int
  return (Votes y n)

-- Main function: Handles basic logic flow.
main :: IO ()
main do =
  putStrLn "=== Welcome to the Voter App ==="
  votes1 <- getVotes
  showResults votes1
  putStrLn "\nWould you like to add more votes? (y/n)"
  choice <- getLine
  if choice == "y"
    then do
      putStrLn "Enter additional votes:"
      votes2 <- getVotes
      let total = combineVotes votes1 votes2
      putStrLn "\nUpdated Results:"
      showResults total
    else
      putStrLn "Bye"
