if (CMAKE_HOST_APPLE)
    file(GLOB LLVM_DIRS /usr/local/opt/llvm*)
    foreach (LLVM_DIR ${LLVM_DIRS})
        list(APPEND CMAKE_PREFIX_PATH ${LLVM_DIRS}/lib/cmake/llvm)
    endforeach ()
endif ()

set(LLVM_CONFIG_EXECUTABLE "llvm-config")
execute_process(
    COMMAND ${LLVM_CONFIG_EXECUTABLE} --cxxflags --ldflags --libs all
    OUTPUT_VARIABLE LLVM_CXXFLAGS
    OUTPUT_STRIP_TRAILING_WHITESPACE
)
string(REPLACE " " ";" LLVM_CXXFLAGS_LIST ${LLVM_CXXFLAGS})
# string(REPLACE "std=c++17" "" LLVM_CXXFLAGS_LIST ${LLVM_CXXFLAGS})
add_compile_options(PRIVATE ${LLVM_CXXFLAGS_LIST})
add_link_options(PRIVATE ${LLVM_CXXFLAGS_LIST})
link_libraries(LLVM-20)

# find_package(LLVM 14 REQUIRED CONFIG)

# message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")

# include_directories(${LLVM_INCLUDE_DIRS})

# add_definitions(${LLVM_DEFINITIONS})

# llvm_map_components_to_libnames(LLVM_LIBS core codegen irreader linker support target ${LLVM_TARGETS_TO_BUILD})
