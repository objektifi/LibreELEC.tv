# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="libbpf"
PKG_VERSION="0.5.0"
PKG_SHA256="d5b27980ceab9a80b6f28d3e67b51cea526fda49bd13151ba966e33548feb4f4"
PKG_LICENSE="LGPL-2.1"
PKG_SITE="https://github.com/libbpf/libbpf"
PKG_URL="https://github.com/libbpf/libbpf/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain elfutils"
PKG_LONGDESC="libbpf supports building BPF CO-RE-enabled applications"
PKG_TOOLCHAIN="make"

make_target() {
  make BUILD_STATIC_ONLY=1 \
       PREFIX=${SYSROOT_PREFIX}/usr \
       -C src
}

makeinstall_target() {
  make BUILD_STATIC_ONLY=1 \
       PREFIX=${SYSROOT_PREFIX}/usr \
       -C src install
}
