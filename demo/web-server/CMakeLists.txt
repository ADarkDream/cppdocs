# cmake version
cmake_minimum_required(VERSION 3.16.3)
# project name
project(web-server)

# set c++ version
set(CMAKE_CXX_STANDARD 17)

set(ENABLE_SSL ON)
add_definitions(-DCPPNET_OPENSSL)
link_libraries(-lssl -lcrypto)

add_subdirectory(../../repo/cppnet/src/lib cppnet)

# include dir add,split by<space>
include_directories(../../repo/cppnet/src/cppnet)
include_directories(../../repo/cppjson)
include_directories(../util)

# link dir add
link_directories(../../repo/cppnet/src/lib)
# link_libraries(-lpthread)

aux_source_directory(../util DIR_SRCS)

# add source
add_executable(webserver ./main.cpp ${DIR_SRCS})
target_link_libraries(webserver cppnet)
target_link_libraries(webserver cppnet)
