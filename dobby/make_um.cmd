@echo off
pushd %~dp0..
cmake --build out\build -t UMTest1
popd
