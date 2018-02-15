DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec"
HOMEPAGE = "https://github.com/jbeder/yaml-cpp/"
SECTION = "libs"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"

PR = "r0"

S = "${WORKDIR}/${PN}-${PN}-${PV}"

SRC_URI = "https://github.com/jbeder/yaml-cpp/archive/${PN}-${PV}.tar.gz"
SRC_URI[md5sum] = "32204de7d9e0ae7ea23bfddecac9f9c6"
SRC_URI[sha256sum] = "25ec37e6d82ab8c485926d69a5567741c7263515f8631e5dcb3fb4708e6b0d0d"

EXTRA_OECMAKE = " \
    -DBUILD_SHARED_LIBS=ON \
    -DYAML_CPP_BUILD_TESTS=OFF \
"

inherit cmake

FILES_${PN}-dev += "${libdir}/cmake/${PN}"
