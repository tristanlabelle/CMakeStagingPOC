add_executable(App main.swift)
target_link_libraries(App PRIVATE WinAppRuntime)

stage_target(App "${CMAKE_BINARY_DIR}/appbin")
stage_target(App "${CMAKE_BINARY_DIR}/allbin")