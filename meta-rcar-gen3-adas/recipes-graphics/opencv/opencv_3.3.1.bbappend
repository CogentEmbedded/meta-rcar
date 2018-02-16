
# Allow to use Qt5 as graphics backend
PACKAGECONFIG_append= " ${@bb.utils.contains("DISTRO_FEATURES", "qt5", "qt5", "", d)}"
PACKAGECONFIG[qt5] = "-DWITH_QT=ON,-DWITH_QT=OFF,qtbase,"

inherit ${@bb.utils.contains( 'DISTRO_FEATURES', 'qt5', 'cmake_qt5','', d)}

# Missing pyhton3-numpy dependency
PACKAGECONFIG_remove = "python3"

# Use Cogent fork of OpenCV 3.3.1 with calibration patches
SRC_URI_remove = "git://github.com/opencv/opencv.git;name=opencv"
SRC_URI_prepend = "git://github.com/cogentembedded/opencv.git;name=opencv;nobranch=1 "
SRCREV_opencv = "0989a90f1dfaea6104d769d4b3dd3de59b0f4606"
