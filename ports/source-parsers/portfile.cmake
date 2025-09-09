vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO TAServers/source-parsers
  REF "22f193bed421f38e3e994e2ba39f1993f75ce582"
  SHA512 12ebc76a9ba2046e5307e25b767c7efdc52b3a47649a1c631639cee8df13e15852c05a8eacb2448a0db47a60a727dfca79d7d845979bf7c11fff11870fdc7438
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
