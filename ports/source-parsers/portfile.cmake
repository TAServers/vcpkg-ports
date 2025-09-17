vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO TAServers/source-parsers
  REF "b202af7a9fe3ed252ece48addfcd8c2fd6230fb1"
  SHA512 592463cd4636e6a4f4f00b8ba3e0a6b5308cdb860f6cf34900e7fb40da5921e7f6aab74e0294bf06a1d811e1614e56a5b8f4a9d54cda512df3c49a893b4c2a89
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
