INCLUDE(FindPkgConfig)
PKG_CHECK_MODULES(PC_COGNITIVE_RADIO cognitive_radio)

FIND_PATH(
    COGNITIVE_RADIO_INCLUDE_DIRS
    NAMES cognitive_radio/api.h
    HINTS $ENV{COGNITIVE_RADIO_DIR}/include
        ${PC_COGNITIVE_RADIO_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    COGNITIVE_RADIO_LIBRARIES
    NAMES gnuradio-cognitive_radio
    HINTS $ENV{COGNITIVE_RADIO_DIR}/lib
        ${PC_COGNITIVE_RADIO_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(COGNITIVE_RADIO DEFAULT_MSG COGNITIVE_RADIO_LIBRARIES COGNITIVE_RADIO_INCLUDE_DIRS)
MARK_AS_ADVANCED(COGNITIVE_RADIO_LIBRARIES COGNITIVE_RADIO_INCLUDE_DIRS)

