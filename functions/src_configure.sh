#!/usr/bin/env sh
#
# Runs configure or cmake, preferring cmake over configure.
#

src_configure() {
  if [ -f "${S}/CMakeLists.txt" ]
    then
    S="${S}/build"
    [ -d "${S}" ] && rm -rf "${S}"
    mkdir "${S}"
    pushd "${S}"
    cmake -DCMAKE_INSTALL_PREFIX="${DESTDIR}" ..
    popd
  elif [ -x "${S}/configure" ]
    then
    pushd "${S}"
    "${S}/configure" --prefix="${DESTDIR}"
    popd
  fi
}