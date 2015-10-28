#!/bin/bash

rm -rf lcov-out gapprof-out cover.gz lcov.info
gap/bin/gap.sh gap/tst/teststandard.g --cover standardcover.gz
mkdir gapprof-out
gap/bin/gap.sh < /vagrant/scripts/gap-prof-build.g
lcov --capture --directory gap/bin/*/ --output-file lcov.info
genhtml lcov.info --output-directory lcov-out
rm -rf /vagrant/output
mkdir /vagrant/output
cp -r gapprof-out lcov-out /vagrant/output

