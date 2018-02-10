DESCRIPTION = "CR7 Loader"

LICENSE = "BSD"
LIC_FILES_CHKSUM = "file://license.md;md5=9b6b96211116d6143a7f1d681d39b13d"

inherit deploy

S = "${WORKDIR}/git"

BRANCH = "rcar_gen3"
SRC_URI = "git://github.com/CogentEmbedded/cr7-loader.git;branch=${BRANCH}"
SRCREV = "9570cd170e876801370560bb0c417816cbfe21d2"

PV = "v1.0+renesas+git"

COMPATIBLE_MACHINE = "condor"
PLATFORM = "rcar"

do_compile() {
    wget https://releases.linaro.org/components/toolchain/binaries/5.1-2015.08/arm-eabi/gcc-linaro-5.1-2015.08-x86_64_arm-eabi.tar.xz
    tar xfJ gcc-linaro-5.1-2015.08-x86_64_arm-eabi.tar.xz

    CROSS_COMPILE=./gcc-linaro-5.1-2015.08-x86_64_arm-eabi/bin/arm-eabi- make RCAR_DRAM_SPLIT=0 RCAR_KICK_MAIN_CPU=2 LSI=V3H RCAR_SECURE_BOOT=0 clean
    CROSS_COMPILE=./gcc-linaro-5.1-2015.08-x86_64_arm-eabi/bin/arm-eabi- make RCAR_DRAM_SPLIT=0 RCAR_KICK_MAIN_CPU=2 LSI=V3H RCAR_SECURE_BOOT=0
}

do_deploy() {
    # Create deploy folder
    install -d ${DEPLOYDIR}

    # Copy CR7 Loader to deploy folder
    install -m 0644 ${S}/cr7_loader.elf ${DEPLOYDIR}/cr7-${MACHINE}.elf
    install -m 0644 ${S}/cr7_loader.bin ${DEPLOYDIR}/cr7-${MACHINE}.bin
    install -m 0644 ${S}/cr7_loader.srec ${DEPLOYDIR}/cr7-${MACHINE}.srec

    install -m 0644 ${S}/bootparam_sa0.srec ${DEPLOYDIR}/bootparam_sa0.bin
    install -m 0644 ${S}/bootparam_sa0.srec ${DEPLOYDIR}/bootparam_sa0.srec

    install -m 0644 ${S}/cert_header_sa3.srec ${DEPLOYDIR}/cert_header_sa3.srec
}

addtask deploy before do_build after do_compile
