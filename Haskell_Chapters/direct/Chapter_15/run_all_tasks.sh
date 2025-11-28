#!/bin/bash
# Script to run all Haskell Chapter 15 task files using for loop from 1 to 10 with runghc

echo "Running all Chapter 15 Haskell tasks..."

for i in {1..10}
do
  echo "===================================="
  echo "Running HC15T${i}*.hs"
  echo "===================================="
  runghc Haskell_Chapters/direct/Chapter_15/HC15T${i}*.hs
  echo ""
done

echo "All tasks executed."
