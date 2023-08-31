cmake_minimum_required(VERSION 3.20)

project("KeyAuthLibrary"
        VERSION 1.0.0
        DESCRIPTION "KeyAuth is an authentication library"
        LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SRC_DIR "${PROJECT_SOURCE_DIR}/src")

# Fetch Modules
message("\nFetching Modules")
include(scripts/http_request.cmake)
include(scripts/json.cmake)

# KeyAuth Library
message(STATUS "KeyAuthLibrary")
file(GLOB_RECURSE SRC_MAIN
    "${SRC_DIR}/**.hpp"
    "${SRC_DIR}/**.h"
    "${SRC_DIR}/**.hh"
    "${SRC_DIR}/**.cpp"
    "${SRC_DIR}/**.cc"
    "${SRC_DIR}/**.cxx"
    "${SRC_DIR}/**.c"
)

if (MSVC)
  add_compile_options(/bigobj)
else ()
  add_compile_options(-Wa,-mbig-obj)
endif ()

add_library(${PROJECT_NAME} STATIC "${SRC_MAIN}")

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set_property(TARGET ${PROJECT_NAME} PROPERTY CXX_STANDARD 20)

target_include_directories(${PROJECT_NAME} PRIVATE
    "${SRC_DIR}"
    "${json_SOURCE_DIR}/single_include"
    "${http_request_SOURCE_DIR}/include"
) 

if("${CMAKE_VS_PLATFORM_NAME}" STREQUAL "x64")
    set(ADDITIONAL_LIBRARY_DEPENDENCIES
        "$(CoreLibraryDependencies);"
        "Psapi;"
        "ws2_32"
    )
endif()


target_link_libraries(${PROJECT_NAME} PRIVATE "${ADDITIONAL_LIBRARY_DEPENDENCIES}")

# Warnings as errors
set_property(TARGET ${PROJECT_NAME} PROPERTY COMPILE_WARNING_AS_ERROR OFF)