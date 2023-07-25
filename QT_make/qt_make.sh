#!/bin/sh

# get QT program name = QT project folder name
QTProgram=$(basename "$PWD")

rm -f $QTProgram

# execute qmake/make
qmake
make

# copy QT program to linux target
cp -f $QTProgram /home/user/shared/buildroot/MA35D1_Buildroot/output/target/root/TestAPP
