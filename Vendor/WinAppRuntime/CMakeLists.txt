add_library(WinAppRuntime INTERFACE)
target_runtime_dependencies(WinAppRuntime
    "${CMAKE_CURRENT_SOURCE_DIR}/WinAppRuntime.dll.txt"
    "${CMAKE_CURRENT_SOURCE_DIR}/en")