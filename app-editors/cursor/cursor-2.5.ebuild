EAPI=8

inherit desktop xdg

DESCRIPTION="Cursor AI IDE"
HOMEPAGE="https://cursor.sh"
SRC_URI="https://downloads.cursor.sh/linux/appimage/x64 -> cursor-${PV}.AppImage"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="strip"

RDEPEND="
    sys-fs/fuse
    x11-libs/libX11
    x11-libs/libxkbcommon
    media-libs/libvpx
"

src_unpack() {
    mkdir -p "${S}"
    cp "${DISTDIR}/cursor-${PV}.AppImage" "${S}/cursor"
    chmod +x "${S}/cursor"
}

src_install() {
    insinto /opt/cursor
    doins cursor
    fperms +x /opt/cursor/cursor

    dosym /opt/cursor/cursor /usr/bin/cursor

    make_desktop_entry /usr/bin/cursor Cursor cursor Development
}
