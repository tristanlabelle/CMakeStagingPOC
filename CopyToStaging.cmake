# Copies files and directories to a staging directory
# Parameters:
#   ITEMS: A list of files or directories to copy
#   DIR: The staging directory
foreach(ITEM ${ITEMS})
    if(NOT EXISTS "${ITEM}")
        message(FATAL_ERROR "Item not found: ${ITEM}")
    endif()

    cmake_path(GET ITEM FILENAME NAME)
    if(IS_DIRECTORY "${PATH}")
        # copy_directory_if_different copies the *contents* of the directory to under a destination directory
        file(MAKE_DIRECTORY "${DIR}/${NAME}")
        execute_process(
            COMMAND "${CMAKE_COMMAND}" -E copy_directory_if_different "${ITEM}" "${DIR}/${NAME}"
            COMMAND_ERROR_IS_FATAL ANY)
    else()
        file(MAKE_DIRECTORY "${DIR}")
        execute_process(
            COMMAND "${CMAKE_COMMAND}" -E copy_if_different "${ITEM}" "${DIR}/${NAME}"
            COMMAND_ERROR_IS_FATAL ANY)
    endif()
endforeach()