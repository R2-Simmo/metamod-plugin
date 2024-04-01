cmake_minimum_required(VERSION 3.27)
project(example_cpp)

set(CMAKE_CXX_STANDARD 17)

include(makefiles/shared.cmake)

add_library(example_cpp SHARED library.cpp ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME} ${LINK_LIBRARIES})

set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/addons/${PROJECT_NAME}/bin/${PLUGIN_PLATFORM}")

configure_file(
        ${CMAKE_CURRENT_LIST_DIR}/plugin.vdf.in
        ${CMAKE_BINARY_DIR}/addons/metamod/${PROJECT_NAME}.vdf
)