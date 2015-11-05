project(ariya-icons NONE)

cmake_minimum_required(VERSION 2.6)

include(CPackConfig.cmake)
include(CPack)

set(ARIYA_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share/icons/ariya")

########### install files ###############

set(icon_dirs 8x8 16x16 22x22 32x32 48x48 64x64 128x128)

install(
    DIRECTORY ${icon_dirs}
    DESTINATION ${ARIYA_INSTALL_DIR}
    PATTERN ".git" EXCLUDE
    PATTERN "*.sh" EXCLUDE
)
install(FILES index.theme DESTINATION ${ARIYA_INSTALL_DIR})

macro(COPY_ICONS _srcdir _srcfile _destdir)
    set(_src "${_srcdir}/${_srcfile}")
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${_src}")
        foreach(_dest ${ARGN})
            install(
                FILES "${_src}"
                DESTINATION ${_destdir}/${_srcdir}
                RENAME "${_dest}"
            )
        endforeach()
    endif()
endmacro()
