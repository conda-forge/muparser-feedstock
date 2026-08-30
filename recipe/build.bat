cmake -LAH -G Ninja %CMAKE_ARGS% ^
    -DCMAKE_PREFIX_PATH="%LIBRARY_PREFIX%" ^
    -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" -B build_ .
if errorlevel 1 exit 1

cmake --build build_ --config Release --target install
if errorlevel 1 exit 1

ctest --test-dir build_ -C Release --output-on-failure
if errorlevel 1 exit 1
