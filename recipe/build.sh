#!/bin/sh

cmake ${CMAKE_ARGS} -G Ninja \
  -DCMAKE_INSTALL_LIBDIR=lib \
  -DCMAKE_INSTALL_RPATH="${PREFIX}/lib" -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON -DCMAKE_MACOSX_RPATH=ON -B build_ .
cmake --build build_ --target install -j${CPU_COUNT}

if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
  ctest --test-dir build_ --output-on-failure
fi

