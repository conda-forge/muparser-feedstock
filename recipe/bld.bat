rem  @echo off

@rem See https://bitbucket.org/dbarbier/ot-superbuild
copy "%RECIPE_DIR%\CMakeLists.txt" .
if errorlevel 1 exit 1

mkdir build
cd build

set CMAKE_CONFIG="Release"

cmake -LAH -G"NMake Makefiles"                               ^
    -DCMAKE_BUILD_TYPE=%CMAKE_CONFIG%                        ^
    -DBUILD_SHARED_LIBS=ON                                   ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ..
if errorlevel 1 exit 1

nmake
if errorlevel 1 exit 1
nmake install
if errorlevel 1 exit 1

start example1.exe

if errorlevel 1 exit 1
