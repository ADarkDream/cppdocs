#!/bin/bash
rm ./cppnet.tar.gz
rm -rf ./cppnet
rm ./demo

cp ~/self/cppnet/src/cppnet.tar.gz .
tar -zxvf ./cppnet.tar.gz
mkdir -p build
cd build
cmake ..
make
mv ./demo ..
