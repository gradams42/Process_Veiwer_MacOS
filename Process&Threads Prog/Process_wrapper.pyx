
# This line declares an external C function "Processes" defined in "process_info.h"
# The 'cdef extern' syntax is used to interface with C code from Cython.
cdef extern from "process_info.h":
    int Processes()

# This function serves as a Python wrapper for the C function "Processes".
# The 'cdef' keyword is used to define a C-level function.
def get_processes():
    # Simply calls the C function and returns its result.
    return Processes()