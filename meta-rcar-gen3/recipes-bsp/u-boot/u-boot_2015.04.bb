require recipes-bsp/u-boot/u-boot.inc

DEPENDS += "dtc-native"

UBOOT_URL = "git://github.com/renesas-rcar/u-boot.git"
BRANCH = "v2015.04/rcar-3.3.x"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"

SRC_URI = "${UBOOT_URL};branch=${BRANCH}"
SRCREV = "7c0de7c397808a4cc7307ca8aa183ab2fec04265"
SRC_URI_append = " \
    file://0001-arch-armv8-SoC-target-select-move.patch \
    file://0002-mmc-add-Micron-eMMC-fixup.patch \
    file://0003-board-renesas-Add-H3ULCB-board.patch \
    file://0004-board-renesas-Add-M3ULCB-board.patch \
    file://0009-rcar-gen3-add-CMD_GPIO.patch \
    file://0011-uboot-board-ulcb-Add-CPLD-support.patch \
    file://0012-ADAS-2184-Added-TTA-R-Drive-u-boot-BSP-support.patch \
    file://0021-ARM-rcar_gen3-Add-RPC-flash-definitions.patch \
    file://0022-mtd-Add-RPC-HyperFlash-support.patch \
    file://0024-board-renesas-ulcb-Enable-RPC-clock.patch \
    file://0027-configs-h3ulcb-Enable-RPC-HyperFlash-support.patch \
    file://0029-configs-ttardrive-Enable-RPC-HyperFlash-support.patch \
    file://0030-board-renesas-ttardrive-Enable-RPC-clock.patch \
"
SRC_URI_append_h3ulcb = '${@ \
    " file://0005-uboot-H3ULCB-support-fixed-PHY.patch \
      file://0006-uboot-H3ULCB-console-on-scif1.patch \
      file://0007-uboot-ravb-r8a7795-remove-PHY-skews.patch \
      file://0008-uboot-h3ulcb-set-all-RAVB-pins-strengh-to-maximum.patch \
      file://0010-net-ravb-fix-unsafe-phy-access.patch " \
    if 'h3ulcb-had' in '${MACHINE_FEATURES}' else \
    ""}'

PV = "v2015.04+git${SRCPV}"

EXTRA_OEMAKE_append = " KCFLAGS=-fgnu89-inline"

UBOOT_SREC ?= "u-boot-elf.srec"
UBOOT_SREC_IMAGE ?= "u-boot-elf-${MACHINE}-${PV}-${PR}.srec"
UBOOT_SREC_SYMLINK ?= "u-boot-elf-${MACHINE}.srec"

do_deploy_append() {
    install -m 644 ${S}/${UBOOT_SREC} ${DEPLOYDIR}/${UBOOT_SREC_IMAGE}
    cd ${DEPLOYDIR}
    rm -f ${UBOOT_SREC} ${UBOOT_SREC_SYMLINK}
    ln -sf ${UBOOT_SREC_IMAGE} ${UBOOT_SREC_SYMLINK}
    ln -sf ${UBOOT_SREC_IMAGE} ${UBOOT_SREC}
}
