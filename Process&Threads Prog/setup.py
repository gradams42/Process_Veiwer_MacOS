from setuptools import setup, Extension
from Cython.Build import cythonize

ext_modules = [
    Extension(
        "Process_wrapper",
        ["Process_wrapper.pyx", "process_info.cpp"],
        language="c++",
        extra_compile_args=["-std=c++11"],
    )
]


setup(
    ext_modules=cythonize(ext_modules),
)
