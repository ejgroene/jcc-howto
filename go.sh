#!/bin/bash

# clean up
rm -rf build dist
mkdir build dist
rm *.egg-info


# compile pkg1 and pkg2 source
javac -d build $(find src -name "*.java")


# make jars
(cd build; jar -c pkg1 > pkg1.jar)
(cd build; jar -c pkg2 > pkg2.jar)


# so python can find our .so's: lucene, pkg1 and pkg2
export PYTHONPATH=dist/usr/local/lib/python3.7/dist-packages:$PYTHONPATH


# make pkg1 extension .so
python3 -m jcc \
        --shared \
        --jar build/pkg1.jar \
        --python pkg1 \
        --build \
        --install \
        --root dist


# make pkg2 extension .so
# We need --import to find the wrappers from pkg,
# but we need --package for jcc to recognize the args types of f.
# that leaves us with two different wrappers for class Wtf.
python3 -m jcc \
        --shared \
        --import pkg1 \
        --package pkg1 \
        --jar build/pkg2.jar \
        --python pkg2 \
        --build \
        --install \
        --root dist


python3 wtf.py
