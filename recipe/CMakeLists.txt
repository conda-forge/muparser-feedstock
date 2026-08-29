cmake_minimum_required(VERSION 3.15)
project(muparser_consumer LANGUAGES CXX)

find_package(muparser CONFIG REQUIRED)

add_executable(muparser_consumer test.cpp)
target_compile_features(muparser_consumer PRIVATE cxx_std_20)
target_link_libraries(muparser_consumer PRIVATE muparser::muparser)
