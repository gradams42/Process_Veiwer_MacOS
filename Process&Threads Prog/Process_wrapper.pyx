

cdef extern from "process_info.h":
    int Processes()

def get_processes():
    return Processes()
