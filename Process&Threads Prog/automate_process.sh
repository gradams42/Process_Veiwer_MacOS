

# Check if Homebrew is installed, install if not
# /bin/bash is the location homebrew is supposed to be installed at, 
# so the command goe sinto that directory for the command
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Check if python3 is installed, install if not
if ! command -v python3 &> /dev/null
then
    echo "Python3 not found, installing..."
    brew install python3
fi

# Check if pip is installed, install if not
if ! command -v pip &> /dev/null
then
    echo "Pip not found, installing..."
    # Install pip using easy_install
    easy_install pip
fi

# Go into "Process&Threads Prog" directory
cd "Process& Threads Prog"

# Set up a virtual environment in terminal
# First Command
python3 -m venv venv

# Second Command
source venv/bin/activate

# Install required dependencies located in requirements.txt "-r does it recursively"
pip install -r requirements.txt

# Build the library locally
python3 setup.py build_ext --inplace

# Run the script
python3 main.py
