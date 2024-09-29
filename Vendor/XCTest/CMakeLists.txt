add_library(XCTest INTERFACE)
target_runtime_dependencies(XCTest "${CMAKE_CURRENT_SOURCE_DIR}/XCTest.dll.txt")