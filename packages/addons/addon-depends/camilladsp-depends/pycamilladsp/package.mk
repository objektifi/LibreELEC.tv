# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="pycamilladsp"
PKG_VERSION="0.5.0"
PKG_SHA256="ed131aef964c8fb9488368340e73b749f1bc98b328b876bd99c7750e269bd5eb"
PKG_ARCH="any"
PKG_LICENSE="GPL v3.0"
PKG_SITE="https://github.com/HEnquist/pycamilladsp"
PKG_URL="https://github.com/HEnquist/pycamilladsp/archive/refs/tags/v{$PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python3 distutilscross:host"
PKG_LONGDESC="This library provides an easy way to communicate with CamillaDSP via a websocket."
PKG_TOOLCHAIN="manual"

###TODO From here on
pre_configure_target() {
  export PYTHONXCPREFIX="${SYSROOT_PREFIX}/usr"
  export LDSHARED="${CC} -shared"
  export CFLAGS="${CFLAGS} -fcommon"
  export CPPFLAGS="${TARGET_CPPFLAGS} -I${SYSROOT_PREFIX}/usr/include/${PKG_PYTHON_VERSION}"
}

make_target() {
  python3 setup.py build
}

