#!/bin/bash

# clean up
#rm -rf build dist
#mkdir build dist
#rm *.egg-info
#rm jars/pkg?.jar


# compile pkg1 source to classes
javac -cp jars/lucene-core-8.1.1.jar \
      -d build \
      $(find src -name "*.java")


# make pkg1 jar
(cd build; jar -c pkg1 > ../jars/pkg1.jar)
(cd build; jar -c pkg2 > ../jars/pkg2.jar)


# so python can find our .so's: lucene, pkg1 and pkg2
export PYTHONPATH=dist/usr/local/lib/python3.7/dist-packages:$PYTHONPATH

if [ "$1" != "--skip" ]
then
    # make Java library .so
    #python3 -m jcc \
    #        --shared \
    #        --package java.lang \
    #        --package java.util \
    #        --package jave.io \
    #        --use_full_names \
    #        --python java \
    #        --build \
    #        --install \
    #        --root dist

    # make Lucene extension .so
    #python3 -m jcc \
    #        --shared \
    #        --import java \
    #        --jar jars/lucene-core-8.1.1.jar \
    #        --use_full_names \
    #        --python lucene \
    #        --build \
    #        --install \
    #        --root dist

    # make pkg1 extension .so
    python3 -m jcc \
            --shared \
            --import java \
            --import lucene \
            --jar jars/pkg1.jar \
            --package org.apache.lucene.search \
            --python pkg1 \
            --build \
            --install \
            --root dist

    # make pkg2 extension .so
    python3 -m jcc \
            --shared \
            --import java \
            --import lucene \
            --import pkg1 \
            --jar jars/pkg2.jar \
            --package org.apache.lucene.search \
            --python pkg2 \
            --build \
            --install \
            --root dist
fi

python3 wtf.py
