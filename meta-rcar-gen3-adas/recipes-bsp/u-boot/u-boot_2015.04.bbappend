FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-net-phy-support-fixed-PHY.patch \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0002-net-ravb-remove-APSR-quirk.patch', '', d)} \
    file://0003-net-ravb-fix-unsafe-phy-access.patch \
    file://0004-configs-rcar-gen3-add-CMD_GPIO.patch \
    file://0005-common-cmd_source.c-Fix-the-source-command-failure-u.patch \
    file://0006-configs-rcar-gen3-common-Enable-U-Boot-scripts.patch \
    file://0007-configs-rcar-gen3-common-Enable-echo-command.patch \
    file://0008-configs-rcar-gen3-common-Enable-setexpr-command.patch \
    file://0009-configs-rcar-gen3-common-Enable-askenv-command.patch \
    file://0010-configs-rcar-gen3-common-Enable-hush-parser.patch \
    file://0011-configs-rcar-gen3-common-Enable-GPT-support.patch \
    file://0012-ARM-rcar_gen3-Add-I2C-definitions.patch \
    file://0013-mtd-spi-QSPI-flash-support.patch \
    file://0014-arm-renesas-Add-Renesas-R8A7797-SoC-support.patch \
    file://0015-board-renesas-Add-V3M-Eagle-board.patch \
    file://0016-tools-fix-build-fail.patch \
    file://0017-board-renesas-Add-V3MSK-board.patch \
    file://0018-arm-renesas-Add-Renesas-R8A7798-SoC-support.patch \
    file://0019-board-renesas-Add-Condor-board.patch \
    file://0020-board-renesas-Add-V3MZF-board.patch \
    file://0021-ARM-rcar_gen3-Add-RPC-flash-definitions.patch \
    file://0022-mtd-Add-RPC-HyperFlash-support.patch \
    file://0023-board-renesas-salvator-x-Enable-RPC-clock.patch \
    file://0024-board-renesas-ulcb-Enable-RPC-clock.patch \
    file://0025-configs-r8a7795_salvator-x-Enable-RPC-HyperFlash-sup.patch \
    file://0026-configs-r8a7796_salvator-x-Enable-RPC-HyperFlash-sup.patch \
    file://0027-configs-h3ulcb-Enable-RPC-HyperFlash-support.patch \
    file://0028-configs-m3ulcb-Enable-RPC-HyperFlash-support.patch \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0041-board-renesas-ulcb-console-on-scif1.patch', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0042-board-renesas-ulcb-set-all-RAVB-pins-strengh-to-maximum.patch', '', d)} \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://0043-board-renesas-ulcb-support-fixed-PHY.patch', '', d)} \
"
