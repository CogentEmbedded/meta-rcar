SUMMARY = "UIM tool for WL18xx module"
SECTION = "misc"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://uim.c;beginline=3;endline=16;md5=ee2f4f9fa92404f383fc3e6315b9dda3"

inherit update-rc.d
INITSCRIPT_NAME="uim-sysfs"
INITSCRIPT_PARAMS = "start 20 2 3 4 5 ."

PV = "0.1+git${SRCPV}"

SRC_URI = "git://git.ti.com/ti-bt/uim.git;protocol=git \
    file://0001-fix-poll-restart-after-fail.patch \
    file://0001-Improve-debug-output.patch \
    file://0002-Fix-possible-cross-compile-issue.patch \
    file://uim-sysfs"
SRCREV = "a75f45be2d5c74fc1dd913d08afc30f09a230aa9"

S = "${WORKDIR}/git"

do_install() {
    install -d ${D}${bindir}
    install -d ${D}${sysconfdir}/init.d

    install -m 0755 uim ${D}${bindir}/
    install -m 0755 ${WORKDIR}/uim-sysfs ${D}${sysconfdir}/init.d

    # Blacklist st_drv and btwilink to prevent modules autoload
    # /etc/init.d/uim-sysfs will do the work with the proper parameters
    install -d ${D}/${sysconfdir}/modprobe.d
    echo "blacklist st_drv" > ${D}/${sysconfdir}/modprobe.d/ti_bt.conf
    echo "blacklist btwilink" >> ${D}/${sysconfdir}/modprobe.d/ti_bt.conf
}