add_executable(UnitTest main.swift)
target_link_libraries(UnitTest PRIVATE XCTest WinAppRuntime)

stage_target(UnitTest "${CMAKE_BINARY_DIR}/testbin")
stage_target(UnitTest "${CMAKE_BINARY_DIR}/allbin")