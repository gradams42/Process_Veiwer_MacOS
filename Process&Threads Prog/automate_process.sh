#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}


# Check if python3 is installed, install if not
if ! command_exists python3; then
    echo "Python3 not found, installing..."
    if command_exists brew; then
        brew install python3
    else
        echo "Homebrew not found, please install Homebrew manually."
        exit 1
    fi
fi

# Check if Homebrew is installed, install if not
if ! command_exists brew; then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if pip is installed, install if not
if ! command_exists pip3; then
    echo "Pip not found, installing..."
    # Install pip using easy_install
    python get-pip.py
fi


echo "Entering VIRTUAL ENVIRONMENT"

# Set up a virtual environment in the terminal
# First Command
python3 -m venv venv

# Activate the virtual environment
source venv/bin/activate

# Install required dependencies located in requirements.txt "-r does it recursively"
pip install -r requirements.txt

# Build the library locally
python3 setup.py build_ext --inplace

# Run the script
python3 main.py
