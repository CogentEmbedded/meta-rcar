DESCRIPTION = "VSP2Driver for the R-Car Gen3"

LICENSE = "GPLv2 & MIT"
LIC_FILES_CHKSUM = " \
    file://GPL-COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
    file://MIT-COPYING;md5=0ebf15a927e436cec699371cd890775c \
"

require include/rcar-gen3-modules-common.inc

inherit module

DEPENDS = "linux-renesas kernel-module-vspm"
PN = "kernel-module-vsp2driver"
PR = "r0"

VSP2DRIVER_URL = " \
    git://github.com/renesas-rcar/vsp2driver.git"
BRANCH = "rcar-gen3"
SRCREV = "8884c714ef3da6d5cd333ccc99b06056146e4860"

SRC_URI = "${VSP2DRIVER_URL};branch=${BRANCH}"

S = "${WORKDIR}/git"

do_compile() {
    cd ${S}/vsp2driver
    make all
}

do_install () {
    # Create destination directories
    install -d ${D}/lib/modules/${KERNEL_VERSION}/extra/
    install -d ${KERNELSRC}/include

    # Install shared library to KERNELSRC(STAGING_KERNEL_DIR) for reference from other modules
    # This file installed in SDK by kernel-devsrc pkg.
    install -m 644 ${S}/vsp2driver/Module.symvers ${KERNELSRC}/include/vsp2.symvers

    # Copy kernel module
    install -m 644 ${S}/vsp2driver/vsp2.ko ${D}/lib/modules/${KERNEL_VERSION}/extra/

    # Install shared header files to KERNELSRC(STAGING_KERNEL_DIR)
    # This file installed in SDK by kernel-devsrc pkg.
    install -m 644 ${S}/vsp2driver/linux/vsp2.h ${KERNELSRC}/include/
}

PACKAGES = "\
    ${PN} \
"

FILES_${PN} = " \
    /lib/modules/${KERNEL_VERSION}/extra/vsp2.ko \
"

RPROVIDES_${PN} += "kernel-module-vsp2driver kernel-module-vsp2"

# Autoload VSP2Driver
KERNEL_MODULE_AUTOLOAD = "vsp2"
