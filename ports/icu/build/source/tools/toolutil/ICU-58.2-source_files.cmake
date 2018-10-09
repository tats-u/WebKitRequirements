# Copyright (c) 2018, NikitaFeodonit. All rights reserved.
#
## ICU build file for CMake build tools

target_sources(${lib_NAME}
  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/collationinfo.cpp
    ${CMAKE_CURRENT_LIST_DIR}/dbgutil.cpp
    ${CMAKE_CURRENT_LIST_DIR}/denseranges.cpp
    ${CMAKE_CURRENT_LIST_DIR}/filestrm.c
    ${CMAKE_CURRENT_LIST_DIR}/filetools.cpp
    ${CMAKE_CURRENT_LIST_DIR}/flagparser.c
    ${CMAKE_CURRENT_LIST_DIR}/package.cpp
    ${CMAKE_CURRENT_LIST_DIR}/pkg_genc.c
    ${CMAKE_CURRENT_LIST_DIR}/pkg_gencmn.c
    ${CMAKE_CURRENT_LIST_DIR}/pkg_icu.cpp
    ${CMAKE_CURRENT_LIST_DIR}/pkgitems.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ppucd.cpp
    ${CMAKE_CURRENT_LIST_DIR}/swapimpl.cpp
    ${CMAKE_CURRENT_LIST_DIR}/toolutil.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ucbuf.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ucln_tu.cpp
    ${CMAKE_CURRENT_LIST_DIR}/ucm.c
    ${CMAKE_CURRENT_LIST_DIR}/ucmstate.c
    ${CMAKE_CURRENT_LIST_DIR}/udbgutil.cpp
    ${CMAKE_CURRENT_LIST_DIR}/unewdata.c
    ${CMAKE_CURRENT_LIST_DIR}/uoptions.c
    ${CMAKE_CURRENT_LIST_DIR}/uparse.c
    ${CMAKE_CURRENT_LIST_DIR}/writesrc.c
    ${CMAKE_CURRENT_LIST_DIR}/xmlparser.cpp

  PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/collationinfo.h
    ${CMAKE_CURRENT_LIST_DIR}/dbgutil.h
    ${CMAKE_CURRENT_LIST_DIR}/denseranges.h
    ${CMAKE_CURRENT_LIST_DIR}/filestrm.h
    ${CMAKE_CURRENT_LIST_DIR}/filetools.h
    ${CMAKE_CURRENT_LIST_DIR}/flagparser.h
    ${CMAKE_CURRENT_LIST_DIR}/package.h
    ${CMAKE_CURRENT_LIST_DIR}/pkg_genc.h
    ${CMAKE_CURRENT_LIST_DIR}/pkg_gencmn.h
    ${CMAKE_CURRENT_LIST_DIR}/pkg_icu.h
    ${CMAKE_CURRENT_LIST_DIR}/pkg_imp.h
    ${CMAKE_CURRENT_LIST_DIR}/ppucd.h
    ${CMAKE_CURRENT_LIST_DIR}/swapimpl.h
    ${CMAKE_CURRENT_LIST_DIR}/toolutil.h
    ${CMAKE_CURRENT_LIST_DIR}/ucbuf.h
    ${CMAKE_CURRENT_LIST_DIR}/ucm.h
    ${CMAKE_CURRENT_LIST_DIR}/udbgutil.h
    ${CMAKE_CURRENT_LIST_DIR}/unewdata.h
    ${CMAKE_CURRENT_LIST_DIR}/uoptions.h
    ${CMAKE_CURRENT_LIST_DIR}/uparse.h
    ${CMAKE_CURRENT_LIST_DIR}/writesrc.h
    ${CMAKE_CURRENT_LIST_DIR}/xmlparser.h
)
