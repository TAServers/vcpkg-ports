vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_github(
  OUT_SOURCE_PATH SOURCE_PATH
  REPO TAServers/source-parsers
  REF "af104c51e5e4bbfeeb63ee7e658d385294dcc8a7"
  SHA512 02630c7f55ce3ae66ec53ee0b606730cf27d8ed46d6015c1461b54a8cf6bad7a2310d7e5a59de4507f550b89925862ba0f38a8d0bab3e5025344fbee39e0b37c
  HEAD_REF master
)

vcpkg_cmake_configure(
  SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME "bspparser")

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/usage" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")
vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/LICENSE")
