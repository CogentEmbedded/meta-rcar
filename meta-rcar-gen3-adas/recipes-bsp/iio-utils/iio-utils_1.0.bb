SUMMARY = "IIO Utils"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=574295575bba94ba7980d611516fe3d2"

DEPENDS = "virtual/kernel"

export KERNELDIR = "${STAGING_KERNEL_DIR}"

S = "${WORKDIR}/iio-utils"

SRC_URI = " \
    file://iio-utils.tar.gz \
"

do_compile() {
    cd ${S}
    make all || die
}

do_install() {
    install -d ${D}${bindir}
    install -m 755 ${S}/iio_event_monitor ${D}${bindir}
    install -m 755 ${S}/lsiio ${D}${bindir}
    install -m 755 ${S}/iio_generic_buffer ${D}${bindir}
}

FILES_${PN} = " \
    ${bindir}/iio_event_monitor \
    ${bindir}/lsiio \
    ${bindir}/iio_generic_buffer \
"
