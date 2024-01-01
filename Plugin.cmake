# ~~~
# Summary:      Local, non-generic plugin setup
# Copyright (c) 2020-2021 Mike Rossiter
# License:      GPLv3+
# ~~~

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.


# -------- Options ----------

#set(OCPN_TEST_REPO
#    "opencpn/tackandlay-alpha"
#    CACHE STRING "Default repository for untagged builds"
#)
#set(OCPN_BETA_REPO
#    "opencpn/tackandlay-beta"
#    CACHE STRING
#    "Default repository for tagged builds matching 'beta'"
#)
#set(OCPN_RELEASE_REPO
#    "opencpn/tackandlay-prod"
#    CACHE STRING
#    "Default repository for tagged builds not matching 'beta'"
#)

#
#
# -------  Plugin setup --------
#
set(PKG_NAME tackandlay_pi)
set(PKG_VERSION  0.3.0)
set(PKG_PRERELEASE "")  # Empty, or a tag like 'beta'

set(DISPLAY_NAME tackandlay)    # Dialogs, installer artifacts, ...
set(PLUGIN_API_NAME tackandlay) # As of GetCommonName() in plugin API
set(PKG_SUMMARY "Simulate ship movements")
set(PKG_DESCRIPTION [=[
Simulates navigation.
]=])

set(PKG_AUTHOR "Mike Rossiter")
set(PKG_IS_OPEN_SOURCE "yes")
set(PKG_HOMEPAGE https://github.com/Rasbats/tackandlay_pi)
set(PKG_INFO_URL https://opencpn.org/OpenCPN/plugins/tackandlay.html)

set(SRC
    src/tackandlay_pi.h
    src/tackandlay_pi.cpp
    src/icons.h
    src/icons.cpp
)

set(PKG_API_LIB api-18)  #  A dir in opencpn-libs/ e. g., api-17 or api-16

macro(late_init)
  # Perform initialization after the PACKAGE_NAME library, compilers
  # and ocpn::api is available.
endmacro ()

macro(add_plugin_libraries)
  # Add libraries required by this plugin
  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/nmea")
  target_link_libraries(${PACKAGE_NAME} ocpn::nmea)

  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/plugin_dc")
  target_link_libraries(${PACKAGE_NAME} ocpn::plugin-dc)

  # The wxsvg library enables SVG overall in the plugin
  add_subdirectory("${CMAKE_SOURCE_DIR}/opencpn-libs/wxsvg")
  target_link_libraries(${PACKAGE_NAME} ocpn::wxsvg)
endmacro ()
