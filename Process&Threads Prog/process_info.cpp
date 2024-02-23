#include <iostream>
#include <libproc.h>
#include <thread>
#include <chrono>
#include <pwd.h>  // to show which user created the process
#include "process_info.h"

extern "C" {

int Processes() {
    // Get the list of process IDs
    int processIDs[2048];  // Max amount of processes being checked
    int numberOfProcesses = proc_listpids(PROC_ALL_PIDS, 0, processIDs, sizeof(processIDs));

    if (numberOfProcesses <= 0) {
        std::cerr << "Failed to retrieve process IDs" << std::endl;
        return 1;
    }

    // Iterate through the list of process IDs
    for (int i = 0; i < numberOfProcesses; i++) {
        // Get process information
        struct proc_bsdinfo processInfo;
        int result = proc_pidinfo(processIDs[i], PROC_PIDTBSDINFO, 0, &processInfo, sizeof(processInfo));

        if (result > 0) {
            // Get user information
            struct passwd *userInfo = getpwuid(processInfo.pbi_uid);

            // Print process and user information
            std::cout << "Process ID: " << processInfo.pbi_pid
                      << "\tName: " << processInfo.pbi_name
                      << "\tUser: " << (userInfo ? userInfo->pw_name : "N/A") << std::endl;
        } else {
            // std::cerr << "Failed to retrieve process information for PID: " << processIDs[i] << std::endl;
        }
    }

    return 0;
}

void PrintProcessInfoPeriodically() {
    while (true) {
        Processes();
        // Sleep for 3 seconds before the next iteration
        std::this_thread::sleep_for(std::chrono::seconds(3));
    }
}

}  // extern "C"


/*
Further Documentation:
https://cplusplus.com/reference/thread/thread/
*/
