FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

COMPATIBLE_MACHINE_eagle = "eagle"
COMPATIBLE_MACHINE_v3msk = "v3msk"
COMPATIBLE_MACHINE_condor = "condor"
COMPATIBLE_MACHINE_v3mzf = "v3mzf"

SRC_URI_append = " \
    ${@bb.utils.contains('MACHINE_FEATURES', 'h3ulcb-had', ' file://hyperflash.cfg', '', d)} \
    ${@base_conditional("SDHI_SEQ", "1", " file://sdhi_seq.cfg", "", d)} \
    file://0001-spi-sh-msiof-fixes.patch \
    file://0002-spi-spidev-add-spi-gpio-into-spidev.patch \
    file://0003-spi-spi-gpio-fix-CPOL-mode.patch \
    file://0004-xhci-rcar-add-firmware-for-R-Car-H2-M2-USB-3.0-host-.patch \
    file://0005-usb-host-xhci-plat-add-support-for-the-R-Car-H3-xHCI.patch \
    file://0006-spi-spi-gpio-fix-set-CPOL-default-inverted.patch \
    file://0008-arm64-do-not-set-dma-masks-that-device-connection-ca.patch \
    file://0009-swiotlb-ensure-that-page-sized-mappings-are-page-ali.patch \
    file://0010-can-rcar_can-add-enable-and-standby-control-pins.patch \
    file://0011-can-rcar_canfd-add-enable-and-standby-control-pins.patch \
    file://0012-mtd-Add-RPC-HyperFlash-driver.patch \
    file://0013-IMR-driver-interim-patch.patch \
    file://0014-lib-swiotlb-reduce-verbosity.patch \
    file://0015-gpio-max732x-fix-gpio-set.patch \
    file://0016-gpio-gpiolib-suppress-gpiod-warning.patch \
    file://0017-media-soc_camera-add-legacy-VIN-CSI2.patch \
    file://0018-arm64-renesas-r8a7797-Add-Renesas-R8A7797-SoC-suppor.patch \
    file://0019-Revert-media-v4l2-async-remove-unneeded-.registered_.patch \
    file://0020-ti-st-add-device-tree-support.patch \
    file://0021-btwilink-add-minimal-device-tree-support.patch \
    file://0022-ASoC-Modify-check-condition-of-multiple-bindings-of-.patch \
    file://0023-ASoC-add-dummy-Si468x-driver.patch \
    file://0024-wl18xx-do-not-invert-IRQ-on-WLxxxx-side.patch \
    file://0025-drm-adv7511-Enable-HPD-interrupts-to-support-hotplug.patch \
    file://0026-drm-adv7511-add-polling-mode-when-no-irq-available.patch \
    file://0027-usb-host-xhci-plat-add-firmware-for-the-R-Car-M3-W-x.patch \
    file://0028-usb-host-xhci-rcar-update-firmware-for-R-Car-H3-and-.patch \
    file://0029-i2c-mux-pca954x-fix-i2c-mux-selection-caching.patch \
    file://0030-Gen3-LVDS-cameras.patch \
    file://0031-media-i2c-Add-ov5647-sensor.patch \
    file://0032-media-i2c-Add-ov5642-sensor.patch \
    file://0033-media-soc-camera-fix-parallel-i-f-in-VIN.patch \
    file://0034-media-soc_camera-Fix-VIDIOC_S_SELECTION-ioctl-miscal.patch \
    file://0040-arm64-dts-renesas-add-ADAS-boards.patch \
    file://0041-arm64-dts-renesas-ulcb-enlarge-cma-region.patch \
    file://0042-arm64-dts-renesas-r8a7795-es1-h3ulcb-disable-eMMC.patch \
    file://0043-arm64-dts-renesas-ulcb-use-versaclock-for-du-rgb-and-lvds.patch \
    file://0044-pinctrl-r8a779x-add-mlb-pinmux.patch \
    file://0045-clk-r8a779x-add-mlp-clock.patch \
    file://0046-arm64-dts-renesas-r8a779x-add-mlp-nodes.patch \
    ${@base_conditional("KF_ENABLE_SD3", "1", " file://0047-arm64-dts-renesas-ulcb-kf-enable-sd3.patch", "", d)} \
    ${@base_conditional("KF_ENABLE_MOST", "1", " file://0048-arm64-dts-renesas-ulcb-kf-enable-most.patch", "", d)} \
    file://0049-clk-r8a779x-add-IMP-clock.patch \
    file://0050-arm64-dts-renesas-r8a779x-add-IMP-nodes.patch \
    file://0051-arm64-renesas-r8a7798-Add-Renesas-R8A7798-SoC-suppor.patch \
    file://0052-soc-renesas-rcar-sysc-Add-workaround-for-A3-PD-issue.patch \
    file://0062-IIO-lsm9ds0-add-IMU-driver.patch \
    file://0063-ASoC-PCM3168A-add-TDM-modes-merge-ADC-and-DAC.patch \
    file://0064-ADV7511-limit-maximum-pixelclock.patch \
    file://0066-pci-pcie-rcar-add-regulators-support.patch \
    file://0067-ti-st-use-proper-way-to-get-shutdown-gpio.patch \
    file://0068-drm-adv7511-use-smbus-to-retrieve-edid.patch \
    file://0070-clk-clk-5p49x-add-5P49V5925-chip.patch \
    file://0071-ASoC-add-dummy-device-for-WL18xx-PCM-audio.patch \
    file://0072-usb-hub-disable-autosuspend-for-SMSC-hubs.patch \
    file://0073-MOST-dim2-add-device-tree-support.patch \
    file://0074-MOST-dim2-add-R-Car3-related-initialization.patch \
    file://0075-MOST-core-fix-memory-allocation-at-arm64.patch \
    file://0076-MOST-dim2-Renesas-R-Car3-variant.patch \
    file://0077-MOST-dim2-add-timeouts.patch \
    file://0078-MOST-aim-fix-null-pointer-crash.patch \
    file://0079-Revert-dmaengine-rcar-dmac-use-TCRB-instead-of-TCR-f.patch \
    file://0082-gpio-pca953x-fix-interrupt-trigger.patch \
    file://0083-spi-Document-DT-bindings-for-SPI-controllers-in-slav.patch \
    file://0084-spi-core-Add-support-for-registering-SPI-slave-contr.patch \
    file://0085-spi-Document-SPI-slave-controller-support.patch \
    file://0086-spi-sh-msiof-Add-slave-mode-support.patch \
    file://0087-spi-slave-Add-SPI-slave-handler-reporting-uptime-at-.patch \
    file://0088-spi-slave-Add-SPI-slave-handler-controlling-system-s.patch \
    file://0089-spi-Generalize-SPI-master-to-controller.patch \
    file://0090-pinctrl-sh-pfc-r8a7795-fix-ssi349_ctrl-name.patch \
    file://0103-gpu-drm-rcar-du-Extend-VSP1-DRM-interface.patch \
    file://0104-media-vsp1-extend-DRM-VSP1-interface.patch \
    file://0105-media-rcar-imr-IMR-driver-updates-for-raw-DL.patch \
    file://0106-media-rcar-imr-Add-RSE-support.patch \
"

SRC_URI_append_h3ulcb = " file://ulcb.cfg"
SRC_URI_append_m3ulcb = " file://ulcb.cfg"
SRC_URI_append_salvator-x = " file://salvator-x.cfg"
SRC_URI_append_eagle = " file://eagle.cfg"
SRC_URI_append_v3msk = " file://v3msk.cfg"
SRC_URI_append_condor = " file://condor.cfg"
SRC_URI_append_v3mzf = " file://v3mzf.cfg"

KERNEL_DEVICETREE_append_h3ulcb = " \
    renesas/r8a7795-es1-h3ulcb-view.dtb \
    renesas/r8a7795-es1-h3ulcb-had-alfa.dtb \
    renesas/r8a7795-es1-h3ulcb-had-beta.dtb \
    renesas/r8a7795-es1-h3ulcb-kf.dtb \
    renesas/r8a7795-es1-h3ulcb-vb.dtb \
    renesas/r8a7795-es1-h3ulcb-vb2.dtb \
    renesas/r8a7795-es1-h3ulcb-vbm.dtb \
    renesas/r8a7795-h3ulcb-view.dtb \
    renesas/r8a7795-h3ulcb-had-alfa.dtb \
    renesas/r8a7795-h3ulcb-had-beta.dtb \
    renesas/r8a7795-h3ulcb-kf.dtb \
    renesas/r8a7795-h3ulcb-vb.dtb \
    renesas/r8a7795-h3ulcb-vb2.dtb \
    renesas/r8a7795-h3ulcb-vbm.dtb \
"

KERNEL_DEVICETREE_append_m3ulcb = " \
    renesas/r8a7796-m3ulcb-view.dtb \
    renesas/r8a7796-m3ulcb-kf.dtb \
"

KERNEL_DEVICETREE_append_salvator-x = " \
    renesas/r8a7795-es1-salvator-x-view.dtb \
    renesas/r8a7795-salvator-x-view.dtb \
    renesas/r8a7796-salvator-x-view.dtb \
"

KERNEL_DEVICETREE_append_eagle = " \
    renesas/r8a7797-es1-eagle.dtb \
    renesas/r8a7797-es1-eagle-function.dtb \
    renesas/r8a7797-eagle.dtb \
    renesas/r8a7797-eagle-function.dtb \
"

KERNEL_DEVICETREE_append_v3msk = " \
    renesas/r8a7797-es1-v3msk.dtb \
    renesas/r8a7797-es1-v3msk-kf.dtb \
    renesas/r8a7797-es1-v3msk-vbm.dtb \
    renesas/r8a7797-es1-v3msk-vbm-v2.dtb \
    renesas/r8a7797-es1-v3msk-view.dtb \
    renesas/r8a7797-v3msk.dtb \
    renesas/r8a7797-v3msk-kf.dtb \
    renesas/r8a7797-v3msk-vbm.dtb \
    renesas/r8a7797-v3msk-vbm-v2.dtb \
    renesas/r8a7797-v3msk-view.dtb \
"

KERNEL_DEVICETREE_append_v3mzf = " \
    renesas/r8a7797-v3mzf.dtb \
"

KERNEL_DEVICETREE_append_condor = " \
    renesas/r8a7798-condor.dtb \
"
