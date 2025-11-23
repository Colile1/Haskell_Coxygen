-- SumNonEmpty.hs : Custom module that defines sumNonEmpty for lists with error on empty list
-- This module provides a safe sum that errors on empty lists.

module SumNonEmpty where

data MyData a b = Error a | Result b deriving (Show)

-- Pure function: sums list or returns error if empty
sumNonEmpty :: Num a => [a] -> MyData String a
sumNonEmpty [] = Error "List is empty"
sumNonEmpty xs = Result (sum xs)
