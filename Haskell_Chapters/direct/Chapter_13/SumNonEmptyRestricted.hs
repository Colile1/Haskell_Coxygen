-- SumNonEmptyRestricted.hs : Custom module with restricted export list to hide internals
-- This module exports only sumNonEmpty and MyData, hiding internal error message

module SumNonEmptyRestricted (sumNonEmpty, MyData) where

errorMessage :: String
errorMessage = "List is empty"

data MyData a b = Error a | Result b deriving (Show)

-- Pure function: sums list or returns error if empty
sumNonEmpty :: Num a => [a] -> MyData String a
sumNonEmpty [] = Error errorMessage
sumNonEmpty xs = Result (sum xs)
