# main.py
import Process_wrapper
import time

if __name__ == "__main__":

    while True:
        #calling the Processes function from Process_wrapper
        print(Process_wrapper.get_processes())

        time.sleep(3)
