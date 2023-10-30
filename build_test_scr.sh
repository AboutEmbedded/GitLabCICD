#!/bin/bash

cd ./tests
sudo rm -r ./build
mkdir ./build
cd ./build

cmake ../
make
