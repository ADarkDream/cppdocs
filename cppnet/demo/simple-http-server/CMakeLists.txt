# cmake version
cmake_minimum_required(VERSION 3.16.3)
# project name
project(temp)

# set c++ version
set(CMAKE_CXX_STANDARD 17)

# include dir add,split by<space>
include_directories(./cppnet/include/cppnet)

# link dir add
link_directories(./cppnet/lib)
include_directories(/opt/homebrew/Cellar/openssl@3/3.3.2/include)
link_directories(/opt/homebrew/Cellar/openssl@3/3.3.2/lib)
add_definitions(-DCPPNET_OPENSSL)
link_libraries(-lpthread)
link_libraries(-lssl -lcrypto)


# add source
add_executable(demo ./main.cpp)
target_link_libraries(demo cppnet)
