#!/bin/sh -ex

XS_VERSION=$(head -n 1 conf-version)
XS_CPP=$(head -n 1 conf-c++)
XS_CPPFLAGS=$(head -n 1 conf-c++flags)
XS_M4=$(which m4)
XS_SHARED_LIBRARY_SUFFIX=$(head -n 1 conf-sosuffix)
XS_URI="urn:com.io7m.lv2:xswitch8:${XS_VERSION}"

XS_BUILD_CPP="${XS_CPP} ${XS_CPPFLAGS} -DXS_URI=${XS_URI}"
XS_LIB_CPP="${XS_CPP} -shared"

mkdir -p out

${XS_M4} \
  -DXS_SHARED_LIBRARY_SUFFIX=${XS_SHARED_LIBRARY_SUFFIX} \
  -DXS_URI=${XS_URI} \
  < manifest.ttl.m4 \
  > out/manifest.ttl

${XS_M4} \
  -DXS_SHARED_LIBRARY_SUFFIX=${XS_SHARED_LIBRARY_SUFFIX} \
  -DXS_URI=${XS_URI} \
  < xswitch8.ttl.m4 \
  > out/xswitch8.ttl

${XS_BUILD_CPP} -o out/xswitch8.o -c xswitch8.cpp
${XS_LIB_CPP} -o out/xswitch8.so out/xswitch8.o

mkdir -p out/xswitch8.lv2
cp out/xswitch8.so out/xswitch8.lv2/
cp out/xswitch8.ttl out/xswitch8.lv2/
cp out/manifest.ttl out/xswitch8.lv2/

