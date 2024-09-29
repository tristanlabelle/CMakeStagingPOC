cmake_minimum_required(VERSION 3.30.0)

project(CMakeStagingPOC LANGUAGES Swift)

function(target_runtime_dependencies TARGET)
    set_target_properties("${TARGET}" PROPERTIES
        TRANSITIVE_LINK_PROPERTIES "RUNTIME_DEPENDENCIES"
        INTERFACE_RUNTIME_DEPENDENCIES "${ARGN}")
endfunction()

function(stage_target TARGET STAGING_DIR)
    # Stage the target's own binary
    add_custom_command(TARGET "${TARGET}" POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different
            "$<TARGET_FILE:${TARGET}>" "${STAGING_DIR}/$<TARGET_FILE_NAME:${TARGET}>"
        VERBATIM)

    # Stage the target's runtime dependencies
    add_custom_command(TARGET "${TARGET}" POST_BUILD
        COMMAND "${CMAKE_COMMAND}"
            -D "ITEMS=$<TARGET_PROPERTY:${TARGET},RUNTIME_DEPENDENCIES>"
            -D "DIR=${STAGING_DIR}"
            -P "${CMAKE_SOURCE_DIR}/CopyToStaging.cmake"
        DEPENDS
            "${CMAKE_SOURCE_DIR}/Stage.cmake"
            $<TARGET_PROPERTY:${TARGET},RUNTIME_DEPENDENCIES>
        VERBATIM)
endfunction()

add_subdirectory(Vendor)
add_subdirectory(UnitTest)
add_subdirectory(App)