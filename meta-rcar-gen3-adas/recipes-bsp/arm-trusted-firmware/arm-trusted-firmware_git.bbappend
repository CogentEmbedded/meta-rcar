FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3hsk = "v3hsk"
ATFW_OPT_r8a77970 = "LSI=V3M RCAR_DRAM_SPLIT=0 RCAR_LOSSY_ENABLE=0 PMIC_ROHM_BD9571=0 RCAR_SYSTEM_SUSPEND=0 SPD=none"
ATFW_OPT_r8a77980 = "LSI=V3H RCAR_DRAM_SPLIT=0 RCAR_LOSSY_ENABLE=0 PMIC_ROHM_BD9571=0 RCAR_SYSTEM_SUSPEND=0 SPD=none RCAR_SECURE_BOOT=0"

ATFW_OPT_append = " ${@oe.utils.conditional("CA57CA53BOOT", "1", " PSCI_DISABLE_BIGLITTLE_IN_CA57BOOT=0", "", d)}"
ATFW_OPT_append = " LIFEC_DBSC_PROTECT_ENABLE=0"
ATFW_OPT_append = " ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", " RCAR_RPC_HYPERFLASH_LOCKED=1", "RCAR_RPC_HYPERFLASH_LOCKED=0", d)}"
EXTRA_ATFW_OPT_append = " ${@oe.utils.conditional("DISABLE_RPC_ACCESS", "1", " RCAR_RPC_HYPERFLASH_LOCKED=1", "RCAR_RPC_HYPERFLASH_LOCKED=0", d)}"

SRC_URI_append = " \
    file://0001-plat-renesas-rcar-bl31-Enable-RPC-access-if-necessar.patch \
    file://0002-plat-rcar_sip_svc-Fix-build-error-when-PMIC_ROHM_BD9.patch \
    file://0003-lib-psci-Fix-CPU0-offline-issue-on-the-V3x-SoCs.patch \
    file://0004-drivers-renesas-io_memdrv-Invalidate-cache-before-ex.patch \
    file://0005-drivers-renesas-rcar-pfc-Update-common-registers.patch \
    file://0006-plat-renesas-rcar-Add-R-Car-V3H-support.patch \
"

do_ipl_opt_deploy_append () {
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/bootparam_sa0.bin ${DEPLOYDIR}/bootparam_sa0-${EXTRA_ATFW_CONF}.bin
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/cert_header_sa6.bin ${DEPLOYDIR}/cert_header_sa6-${EXTRA_ATFW_CONF}.bin
}

do_deploy_append() {
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/bootparam_sa0.bin ${DEPLOYDIR}/bootparam_sa0.bin
    install -m 0644 ${S}/tools/renesas/rcar_layout_create/cert_header_sa6.bin ${DEPLOYDIR}/cert_header_sa6.bin
}

do_deploy_append_r8a77970() {
    rm ${DEPLOYDIR}/bootparam_sa0.bin
    rm ${DEPLOYDIR}/bootparam_sa0.srec
}

do_deploy_append_r8a77980() {
    rm ${DEPLOYDIR}/bootparam_sa0.bin
    rm ${DEPLOYDIR}/bootparam_sa0.srec
}
