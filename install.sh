#!/bin/bash
# Install Haskell compiler and tools on WSL (Ubuntu/Debian)

set -e  # stop on error

echo "Updating package lists..."
sudo apt update

echo "Installing Haskell compiler (GHC), Cabal, and Stack..."
sudo apt install -y ghc cabal-install haskell-stack

echo "Verifying installations..."
ghc --version
cabal --version
stack --version

echo "✅ Haskell installation complete!"
