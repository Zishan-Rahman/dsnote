#!/usr/bin/env bash

set -e

VERSION="4.3.0"
REV="1"
ARCH="amd64"
LDIR="$(
    cd "$(dirname "$0")"
    pwd -P
)"
DS_DIR="dsnote_${VERSION}-${REV}_${ARCH}"
DS_DEB="${DS_DIR}/DEBIAN"
DS_DOC="${DS_DIR}/usr/share/doc/dsnote"

mkdir -p build && cd build

cmake ../../ -DCMAKE_BUILD_TYPE=Release -DWITH_DESKTOP=ON \
    -DWITH_PY=ON \
    -DBUILD_LIBARCHIVE=OFF \
    -DBUILD_FMT=OFF \
    -DBUILD_CATCH2=OFF \
    -DBUILD_OPENBLAS=OFF \
    -DBUILD_XZ=OFF \
    -DBUILD_PYBIND11=OFF \
    -DBUILD_RUBBERBAND=OFF \
    -DBUILD_FFMPEG=ON \
    -DBUILD_TAGLIB=OFF \
    -DBUILD_VOSK=OFF \
    -DDOWNLOAD_VOSK=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev

#    -DBUILD_WHISPERCPP_CUBLAS=OFF \
#    -DBUILD_WHISPERCPP_HIPBLAS=OFF \

test $(nproc) -gt 2 && make -j$(($(nproc)-2)) || make

mkdir -p "$DS_DEB"

make DESTDIR="$DS_DIR" install

cp -av "${LDIR}/debian/control" "$DS_DEB"
cp -av "${LDIR}/debian/postinst" "$DS_DEB"

cp -av "${LDIR}/debian/changelog" changelog.Debian
gzip --best -n changelog.Debian
mkdir -p "$DS_DOC"
mv changelog.Debian.gz "$DS_DOC"

cp -av "${LDIR}/debian/copyright" "$DS_DOC"

dpkg-deb --root-owner-group --build "$DS_DIR"

mv "${DS_DIR}.deb" ../
