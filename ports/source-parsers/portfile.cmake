vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO TAServers/source-parsers
  REF "9eaa22b9c37b6da23c485034eac1f30a6cdc76ba"
  SHA512 06159ac22ae31172d1ec95ff68d788a35aef4e4fcb946e9b73db36e7bccf63a9ccce2753920cdc4bda30b0cb2959a7fb1dade7ad77ec7031a16cd274f349c653
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "bspparser")
vcpkg_cmake_config_fixup(PACKAGE_NAME "mdlparser")
vcpkg_cmake_config_fixup(PACKAGE_NAME "phyparser")
vcpkg_cmake_config_fixup(PACKAGE_NAME "vdfparser")
vcpkg_cmake_config_fixup(PACKAGE_NAME "vpkparser")
vcpkg_cmake_config_fixup(PACKAGE_NAME "vtfparser")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
