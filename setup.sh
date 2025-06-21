#!/bin/bash -e

# Check git installation
if ! command -v git &> /dev/null; then
  pkg install -y git
fi

# Check make installation
if ! command -v make &> /dev/null; then
  pkg install -y make
fi

# Clone the repository if it doesn't exist
if [ ! -d "$HOME/Termux" ]; then
  git clone https://github.com/syoch/Termux.git "$HOME/Termux"
else
  echo "Repository already exists. Pulling latest changes..."
  cd "$HOME/Termux" || exit
  git pull
fi

make -C "$HOME/Termux" all