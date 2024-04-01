if (UNIX AND NOT APPLE)
    set(LINUX true)
endif ()

if (WIN32 AND NOT MSVC)
    message(FATAL_ERROR "Unsupported compiler, support: MSVC")
endif ()

set(CMAKE_STATIC_LIBRARY_PREFIX "")

get_filename_component(SDK_ROOT ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
set(HL2SDK_ROOT ${SDK_ROOT}/hl2sdk-cs2)
set(METAMOD_ROOT ${SDK_ROOT}/metamod-sdk)

set(HL2SDK_LIB ${HL2SDK_ROOT}/lib)

add_definitions(-DMETA_IS_SOURCE2)

if (LINUX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
elseif (WIN32)
    # debug
    set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS} /NODEFAULTLIB:libcmt")
    # general
    add_definitions(-D_CRT_SECURE_NO_DEPRECATE -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /W3 /Zi /std:c++17")
    set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
    include(makefiles/win32.cmake)
endif ()

include_directories(
        # HL2SDK from manifests
        ${HL2SDK_ROOT}/thirdparty/protobuf-3.21.8/src
        ${HL2SDK_ROOT}/public
        ${HL2SDK_ROOT}/public/engine
        ${HL2SDK_ROOT}/public/mathlib
        ${HL2SDK_ROOT}/public/vstdlib
        ${HL2SDK_ROOT}/public/tier0
        ${HL2SDK_ROOT}/public/tier1
        ${HL2SDK_ROOT}/public/entity2
        ${HL2SDK_ROOT}/public/game/server
        ${HL2SDK_ROOT}/game/shared
        ${HL2SDK_ROOT}/game/server
        ${HL2SDK_ROOT}/common
        ${HL2SDK_ROOT}
        # MetaMod core
        ${METAMOD_ROOT}/core
        # MetaMod SourceHook
        ${METAMOD_ROOT}/core/sourcehook
)

add_custom_command(
        OUTPUT protobuf_dist
        COMMAND ${PROTOC_EXECUTABLE} --proto_path=thirdparty/protobuf-3.21.8/src --proto_path=common --cpp_out=common common/network_connection.proto
        COMMENT "Building Protobuf object"
        WORKING_DIRECTORY ${HL2SDK_ROOT}
        VERBATIM
)

set(SOURCE_FILES ${SOURCE_FILES} protobuf_dist)