# Import necessary modules from setuptools and Cython
from setuptools import setup, Extension
from Cython.Build import cythonize

# Define the Cython extension module
ext_modules = [
    Extension(
        "Process_wrapper",            # Name of the Cython extension module
        ["Process_wrapper.pyx", "process_info.cpp"],  # Cython and C++ source files
        language="c++",               # Language specification (C++)
        extra_compile_args=["-std=c++11"],  # Additional compilation arguments for C++11 standard
    )
]

# Set up the package with the cythonized extension modules
setup(
    ext_modules=cythonize(ext_modules),  # Cythonize the defined extension modules
)

# Links for further documentation:

# "https://pythonhosted.org/an_example_pypi_project/setuptools.html"
# "https://cython.readthedocs.io/en/latest/"