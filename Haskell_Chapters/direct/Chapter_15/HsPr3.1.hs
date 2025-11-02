data VoteCount = VoteCount
  { yesVotes :: Int
  , noVotes  :: Int
  } deriving (Show)

data VotingRegister = VotingRegister
  { votes :: [VoteCount]
  } deriving (Show)

instance Semigroup VotingRegister where
  (<>) (VotingRegister a) (VotingRegister b) = VotingRegister (a <> b)

instance Monoid VotingRegister where
  mempty = VotingRegister []
  mappend (VotingRegister a) (VotingRegister b) = VotingRegister (a <> b)

instance Semigroup VoteCount where
  (<>) (VoteCount y1 n1) (VoteCount y2 n2) = VoteCount (y1 + y2) (n1 + n2)

instance Monoid VoteCount where
  mempty = VoteCount 0 0

createVoteCount :: Int -> Int -> VoteCount
createVoteCount y n = VoteCount {yesVotes = y, noVotes = n}

addVoteToRegister :: VoteCount -> VotingRegister -> VotingRegister
addVoteToRegister v (VotingRegister xs) = VotingRegister (v : xs)

showResults :: VotingRegister -> IO ()
showResults (VotingRegister xs) do =
  let total = mconcat xs
  putStrLn ("Total YES votes: " ++ show (yesVotes total))
  putStrLn ("Total NO votes: " ++ show (noVotes total))


main :: IO ()
main do =
  let v1 = createVoteCount 4 2
  let v2 = createVoteCount 3 9
  let v3 = createVoteCount 5 1

  let register1 = VotingRegister v1
  let register2 = addVoteToRegister v2 register1
  let register3 = addVoteToRegister v3 register2

  mempty <> register1 <> register2 <> register3
  mappend register1 register2
  showResults register3
