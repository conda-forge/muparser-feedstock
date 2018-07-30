@rem See https://bitbucket.org/dbarbier/ot-superbuild
copy "%RECIPE_DIR%\CMakeLists.txt" .
if errorlevel 1 exit 1

mkdir build_ && cd build_

set CMAKE_CONFIG="Release"

cmake -LAH -G"NMake Makefiles"                               ^
    -DCMAKE_BUILD_TYPE=%CMAKE_CONFIG%                        ^
    -DBUILD_SHARED_LIBS=OFF                                  ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ..
if errorlevel 1 exit 1

cmake --build . --config %CMAKE_CONFIG% --target install
if errorlevel 1 exit 1

start example1.exe
if errorlevel 1 exit 1
