#!/bin/bash
set -u
set -e
rm -rf gap
git clone https://github.com/gap-system/gap.git --depth 10
cd gap
./configure --with-gmp=system CFLAGS="-O0 --coverage" LDFLAGS="-O0 --coverage"
make
make bootstrap-pkg-full
(cd pkg/io-* && ./configure && make)
(cd pkg && git clone https://github.com/ChrisJefferson/profiling &&
  cd profiling && ./autogen.sh && ./configure && make)
