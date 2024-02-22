# Process Viewer for MacOS

This project provides a Python wrapper for interacting with C++ code to retrieve information about running processes on MacOS.

## Getting Started

### Clone the Repository

You can clone the repository with:

git clone https://github.com/gradams42/Process_Veiwer_MacOS.git

or 

gh repo clone gradams42/Process_Veiwer_MacOS

# Go into "Process&Threads Prog" directory

cd Process&\ Threads\ Prog

# Ensure python3 is installed

brew install python3

# set up a virtual enviornment in terminal

python3 -m venv venv
source venv/bin/activate

# install requires dependencies
pip install -r requirements.txt

# build the code

python3 setup.py build_ext --inplace

# run the script

python3 main.py
