@echo off
setlocal
chcp 65001
pushd %~dp0..
mkdir out
cd out
rem x86-Clang-Release-Debug
set "ccflags=/MT /Zi /O2 /Ob2 /DNDEBUG"
cmake ^
    -B build --install-prefix "%cd%\install" ^
    -G "MinGW Makefiles" -DCMAKE_MAKE_PROGRAM="D:\sdks\w64devkit-x86\bin\make.exe" ^
    --toolchain dobby\x86toolchain.cmake ^
    -DCLANG_TYPE="CLANG-CL" -DCUSTOM_CLANG="false" -DIS_X64="false" ^
    -DCMAKE_SYSTEM_VERSION="10.0.20348.0" ^
    -DCMAKE_IS_BROKEN=false ^
    -DCMAKE_BUILD_TYPE=RelWithDebInfo ^
    -DCMAKE_C_FLAGS_RELWITHDEBINFO="%ccflags%" ^
    -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="%ccflags%" ^
    -DSIZE_OPTIMIZE="false" -DSTATIC_CSOUND="false" ^
    %* ^
    ..
set exitlevel=%ERRORLEVEL%
popd
exit /b %exitlevel%
endlocal
