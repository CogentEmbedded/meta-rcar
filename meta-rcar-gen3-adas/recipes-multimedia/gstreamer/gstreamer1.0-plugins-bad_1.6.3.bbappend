FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-${PV}:"

SRC_URI_append = " \
    file://0001-install-wayland.h-header.patch \
    file://0002-pkgconfig-libgstwayland.patch \
    file://0001-kmssink-add-plugin-and-sink-element.patch \
    file://0002-kmssink-calculate-display-ratio.patch \
    file://0003-kmssink-add-dmabuf-support.patch \
    file://0004-kmssink-wait-for-page-flip-or-vblank.patch \
    file://0005-kmssink-keep-last-rendered-buffer-in-memory.patch \
    file://0006-kmssink-enable-Y42B-planar-YUV-4-2-2-format.patch \
    file://0007-kmssink-enable-NV16-chroma-interleaved-YUV-4-2-2-for.patch \
    file://0008-kmssink-enable-UYVY-YUY2-and-YVYU-interleaved-YUV-4-.patch \
    file://0009-kmssink-add-sync-support-for-secondary-pipes.patch \
    file://0010-kmssink-chain-up-finalize-method.patch \
    file://0011-kmssink-use-trace-level-for-buffer-render-log.patch \
    file://0012-kmssink-frame-copy-log-in-performance-category.patch \
    file://0013-kmsbufferpool-error-only-if-no-allocator.patch \
    file://0014-kmssink-add-a-plane-id-property.patch \
    file://0015-kmssink-fallback-to-universal-planes-if-no-overlay-p.patch \
    file://0016-kmssink-Fix-offsets-handling.patch \
    file://0017-kmssink-override-stride-if-defined-in-driver.patch \
    file://0018-kmssink-Fix-selection-of-source-region.patch \
    file://0019-kmssink-Scale-up-to-the-screen-dimension.patch \
    file://0020-kms-rename-variable-used.patch \
    file://0021-kmssink-remove-custom-gst_kms_sink_get_times.patch \
    file://0022-kmssink-do-not-get-kms-bo-pitch-for-planar-formats.patch \
    file://0023-kmssink-Enable-in-meson-build.patch \
    file://0024-kmssink-Trivial-naming-fix-in-meson-for-consistency.patch \
    file://0025-kmssink-remove-dependency-on-libkms.patch \
    file://0026-kms-include-stdlib.h.patch \
    file://0027-kmssink-include-drm.h-after-stdlib.h.patch \
    file://0028-kmssink-add-mode-setting-and-base-plane-rendering.patch \
    file://0029-kmssink-set-mode-based-on-framebuffer-configuration.patch \
    file://0030-kmssink-allow-only-supported-resolutions.patch \
    file://0031-kmssink-add-parameter-force-modesetting.patch \
    file://0032-kmssink-configure-display-mode-during-set_caps.patch \
    file://0033-kmssink-post-error-message-if-start-fails.patch \
    file://0034-Rename-plugin-filesnames-to-match-plugin-names.patch \
    file://0035-kmssink-adjust-memory-offset-calculation-for-dmabuf-.patch \
    file://0036-kmssink-Fix-compiler-warning-with-gcc-7.patch \
    file://0037-docs-Port-all-docstring-to-gtk-doc-markdown.patch \
    file://0038-kmssink-if-the-plane-can-not-scale-retry-without-sca.patch \
    file://0039-kmssink-Add-msm-to-the-list-of-drivers.patch \
    file://0040-gst-Clear-floating-flag-in-constructor-of-all-GstObj.patch \
    file://0041-kmssink-Add-xilinx_drm-to-the-list-of-drivers.patch \
    file://0042-kmssink-Factor-out-copying-to-dump-buffer.patch \
    file://0043-kmssink-Don-t-leak-GEM-primed-from-DMABuf.patch \
    file://0044-kmssink-drop-last-rendered-buffer-on-ALLOCATION-and-.patch \
    file://0045-kmssink-Move-kmsmem-cache-code-higher.patch \
    file://0046-kmssink-Track-cached-kmsmem-and-clear-them-on-drain.patch \
    file://0047-kmssink-initialize-variable.patch \
    file://0048-kmsallocator-inline-gst_kms_allocator_alloc_empty.patch \
    file://0049-kmsallocator-add-driver-pitch-support-for-planar-for.patch \
    file://0050-kmssink-support-videooverlay-interface.patch \
    file://0051-Revert-kmssink-support-videooverlay-interface.patch \
    file://0052-kmssink-Free-devname-before-setting-it.patch \
    file://0053-kmssink-Add-bus-id-property.patch \
    file://0054-Request-minimum-buffer-even-if-need_pool-is-FALSE.patch \
    file://0055-kms-fix-crash-if-bo-allocation-failed-when-copying-t.patch \
    file://0056-kmssink-Don-t-assume-buffer-pool-won-t-touch-buf-poi.patch \
    file://0057-kmssink-Don-t-leak-the-dumb-buffer-on-drain.patch \
    file://0058-kmssink-Check-if-we-can-prime-export.patch \
    file://0059-kmsbufferpool-Removed-unused-member-fd.patch \
    file://0060-kmsbufferpool-Don-t-check-allocator-pointer-twice.patch \
    file://0061-kmssink-Move-the-mem-cache-into-the-allocator.patch \
    file://0062-kms-Export-DMABuf-from-Dumb-buffer-when-possible.patch \
    file://0063-kmsallocator-Update-GstVideoInfo.size-when-extrapola.patch \
    file://0064-kms-Fix-compilation-error-when-libdrm-2.4.68.patch \
    file://0065-kmssink-Fix-crash-on-NULL-dmabuf-allocator-pointer.patch \
    file://0066-kmssink-Add-Raspberry-Pi-vc4-support.patch \
    file://0067-kmssink-add-can-scale-property.patch \
    file://0068-kmssink-support-videooverlay-interface.patch \
    file://0069-kmssink-Add-display-width-height-properties.patch \
    file://0070-kmssink-Enforce-pixel-aspect-ratio-when-we-cannot-sc.patch \
    file://0071-kmssink-Fix-CropMeta-support.patch \
    file://0072-kmssink-Make-render-rectangle-property-controllable.patch \
    file://0073-kmssink-Add-Amlogic-upstreamer-DRM-driver-support.patch \
    file://0074-kmssink-Add-support-for-the-Allwinner-DRM-driver-sun.patch \
    file://0075-kmssink-Add-new-entry-for-Xilinx-DRM-Driver.patch \
    file://0076-kmssink-Add-24bit-RGB-support.patch \
    file://0077-kmssink-Add-support-for-mxsfb-drm-driver.patch \
    file://0078-kmssink-configure-mode-setting-from-video-info.patch \
    file://0079-gstkmssink-add-rcar-du-to-driver-list.patch \
    file://0080-kmssink-comment-out-setting-getting-video-overlay-pr.patch \
"