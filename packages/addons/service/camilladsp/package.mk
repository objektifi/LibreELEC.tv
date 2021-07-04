# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="camilladsp"
PKG_VERSION="0.5.2"
PKG_SHA256="49ada8fd4001546c85f6cbf449719e0671b9a7c3991ee1ff4dd65dd50e709f22"
PKG_ARCH="any"
PKG_LICENSE="GPL-3.0"
PKG_SITE="https://github.com/HEnquist/camilladsp"
PKG_URL="https://github.com/HEnquist/camilladsp/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain alsa-lib pulseaudio openssl rust"
PKG_LONGDESC="CamillaDSP ($PKG_VERSION) provides audio processing with combinations of FIR and IIR filters"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="CamillaDSP"
PKG_ADDON_TYPE="xbmc.service"
PKG_MAINTAINER="Chris McKeague"

make_target() {
  . $(get_build_dir rust)/cargo/env
	RUSTFLAGS='-C target-feature=+neon -C target-cpu=native' \
		cargo build \
    --release \
    --no-default-features \
    --features "alsa-backend" \
		--features "websocket"
  ${STRIP} ${PKG_BUILD}/.${TARGET_NAME}/release/camilladsp
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
    cp ${PKG_BUILD}/.${TARGET_NAME}/*/release/camilladsp \
       ${ADDON_BUILD}/${PKG_ADDON_ID}/bin
}
