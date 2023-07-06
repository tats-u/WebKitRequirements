include(${CMAKE_CURRENT_LIST_DIR}/vcpkg_acquire_gnuwin32_program.cmake)

set(VERSION 3.0.0)

# Get archive
vcpkg_download_distfile(ARCHIVE
    URLS "https://github.com/libjpeg-turbo/libjpeg-turbo/archive/${VERSION}.zip"
    FILENAME "libjpeg-turbo-${VERSION}.zip"
    SHA512 35cd6c6a87bdf42bfcac46095eaca145e46048baa1d9774dd2838dfbd7526d9a3861ae81497a7b7b7db9babdee596fc3aa27f35a9f6739a3367c2f99408e05e6
)

# Patches
set(PATCHES
    ${CMAKE_CURRENT_LIST_DIR}/patches/0001-Make-executables-conditional.patch
    ${CMAKE_CURRENT_LIST_DIR}/patches/0002-Adjust-CMake-for-vcpkg.patch
)

# Extract archive
vcpkg_extract_source_archive_ex(
    OUT_SOURCE_PATH SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    REF ${VERSION}
    PATCHES ${PATCHES}
)

# Find NASM and add to the path
vcpkg_find_acquire_program(NASM)
get_filename_component(NASM_EXE_PATH ${NASM} DIRECTORY)
vcpkg_add_to_path(${NASM_EXE_PATH})

# Find gnutools and add to the path
vcpkg_acquire_gnuwin32_program(GREP)
vcpkg_acquire_gnuwin32_program(SED)
get_filename_component(GREP_EXE_PATH ${GREP} DIRECTORY)
get_filename_component(SED_EXE_PATH ${SED} DIRECTORY)
vcpkg_add_to_path(${GREP_EXE_PATH})
vcpkg_add_to_path(${SED_EXE_PATH})

# Run CMake build
set(BUILD_OPTIONS
    -DENABLE_EXECUTABLES=OFF
    -DWITH_SIMD=ON
    -DWITH_TURBOJPEG=OFF
)

string(COMPARE EQUAL ${VCPKG_LIBRARY_LINKAGE} "dynamic" ENABLE_SHARED)
string(COMPARE EQUAL ${VCPKG_LIBRARY_LINKAGE} "static" ENABLE_STATIC)

if (NOT VCPKG_CMAKE_SYSTEM_NAME OR VCPKG_CMAKE_SYSTEM_NAME MATCHES "^Windows")
    string(COMPARE EQUAL ${VCPKG_CRT_LINKAGE} "dynamic" WITH_CRT_DLL)

    list(APPEND BUILD_OPTIONS -DWITH_CRT_DLL=${WITH_CRT_DLL})
endif ()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        ${BUILD_OPTIONS}
        -DENABLE_STATIC=${ENABLE_STATIC}
        -DENABLE_SHARED=${ENABLE_SHARED}
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()
vcpkg_fixup_pkgconfig()

# Prepare distribution
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/share)
file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/libjpeg-turbo RENAME copyright)
file(WRITE ${CURRENT_PACKAGES_DIR}/share/libjpeg-turbo/version ${VERSION})
