project(ariya-icons NONE)

cmake_minimum_required(VERSION 2.6)
# include specific modules
set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

if (WIN32)
   set(ICON_INSTALL_DIR         "share/icons"             ) # The icon install dir (default ${SHARE_INSTALL_PREFIX}/share/icons/)
else (WIN32)
   set(SHARE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}/share" )
   set(ICON_INSTALL_DIR     "${SHARE_INSTALL_PREFIX}/icons" )
endif(WIN32)

########### install files ###############

set( icon_dirs  places devices apps emotes emblems animations actions status categories panel mimes )

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

