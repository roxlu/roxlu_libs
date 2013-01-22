#!/bin/bash
# Compiling libvpx
# -----------------

d=${PWD}
bd=${d}/../build
sd=${d}/../../sources/

export CXXFLAGS="-fpic"
export CFLAGS="-I${bd}/include/ -fpic"
export CPPFLAGS=${CFLAGS}
export LDFLAGS="-L${bd}/lib/"
export PATH=${bd}/bin:${PATH}
export LIBFFI_LIBS="-L${bd}/lib/ -lffi"
export LIBFFI_CFLAGS="-I${bd}/include/ -I${bd}/lib/libffi-3.0.11/include/"
export PKG_CONFIG=${bd}/bin/pkg-config
export PKG_CONFIG_PATH=${bd}/lib/pkgconfig

cd ${sd}/libvpx
./configure --prefix=${bd} \
    --enable-pic \
    --enable-vp8 \
    --enable-vp9 \
    --enable-static \
    --as=yasm

make clean 
make 
make install

