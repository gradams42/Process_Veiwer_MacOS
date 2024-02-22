// This header file includes declarations to ensure proper interfacing
// between C and C++ code. It guards against multiple inclusion using
// the standard #ifndef, #define, #endif pattern.

#ifndef PROCESS_INFO_H
#define PROCESS_INFO_H

// This section allows the header file to be used in both C and C++ code.
#ifdef __cplusplus
extern "C" {
#endif

// Function declaration for the 'Processes' function.
// This function is likely implemented in a corresponding C source file.
int Processes();

// End the extern "C" block if this header is included in a C++ file.
#ifdef __cplusplus
}
#endif

#endif // PROCESS_INFO_H