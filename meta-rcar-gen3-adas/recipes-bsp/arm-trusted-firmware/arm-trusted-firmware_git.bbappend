FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_v3mzf = "v3mzf"
ATFW_OPT_r8a7797 = "LSI=V3M RCAR_DRAM_SPLIT=0 RCAR_LOSSY_ENABLE=0 PMIC_ROHM_BD9571=0 RCAR_SYSTEM_SUSPEND=0 SPD=none"

ATFW_OPT_append = " ${@base_conditional("CA57CA53BOOT", "1", " PSCI_DISABLE_BIGLITTLE_IN_CA57BOOT=0", "", d)}"
ATFW_OPT_append += " ${@base_conditional("DISABLE_RPC_ACCESS", "1", " RCAR_DISABLE_NONSECURE_RPC_ACCESS=1", "", d)}"
ATFW_OPT_append += " LIFEC_DBSC_PROTECT_ENABLE=0"

SRC_URI_append = " \
    file://0001-plat-renesas-rcar-Make-RPC-secure-settings-optional.patch \
    file://0002-plat-renesas-rcar-kingfisher-reboot-fix-power-off-on-reset.diff \
    file://0003-plat-renesas-rcar-V3M-support.patch \
"

do_deploy_append() {
    install -m 0644 ${S}/tools/dummy_create/bootparam_sa0.bin ${DEPLOYDIR}/bootparam_sa0.bin
    install -m 0644 ${S}/tools/dummy_create/cert_header_sa6.bin ${DEPLOYDIR}/cert_header_sa6.bin
}
