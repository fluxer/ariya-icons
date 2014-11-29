project(ariya-icons NONE)

cmake_minimum_required(VERSION 2.6)
# include specific modules
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(SHARE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/share" )
set(ICON_INSTALL_DIR     "${SHARE_INSTALL_PREFIX}/icons" )

########### install files ###############

set( icon_dirs  16x16 24x24 32x32 48x48 64x64 128x128 scalable/symbolic )

set(ARIYA_INSTALL_DIR ${ICON_INSTALL_DIR}/ariya)
install( DIRECTORY ${icon_dirs} DESTINATION ${ARIYA_INSTALL_DIR} PATTERN .git EXCLUDE PATTERN "*.sh" EXCLUDE )
install( FILES index.theme DESTINATION ${ARIYA_INSTALL_DIR})

macro (COPY_ICONS _srcdir _srcfile _destdir)
  set(_src "${_srcdir}/${_srcfile}")
  if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/${_src}")
    foreach(_dest ${ARGN})
      install( FILES "${_src}" DESTINATION ${_destdir}/${_srcdir} RENAME "${_dest}" )
    endforeach()
  endif()
endmacro (COPY_ICONS)

# Copy the msoffice icon to the msoffice-2007 mimetypes (#225507)
foreach(_sizedir ${icon_dirs})

endforeach()

