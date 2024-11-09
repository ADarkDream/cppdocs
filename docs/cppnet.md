# cppnet
- 一个轻量级 C++ 网络框架
## Quick Start
## 直接使用构建好的
1. 下载 release 库([Releases · chenxuan520/cppnet](https://github.com/chenxuan520/cppnet/releases)) , 并且解压(地点可以随意, 可以放到系统的 include 也可以不放 下文假设是解压到当前目录)
	- 这里如果是需要ssl (需要安装 openssl ),就下载 ssl 的版本, 都这下载默认即可
2. 编写代码, 这一步可以根据需要编写代码, 下面是一个简单的demo , 具体的函数介绍可以参考文档内容
```cpp
#include "./cppnet/include/cppnet/http/server/http_server.hpp"
#include "./cppnet/include/cppnet/utils/const.hpp"
#include <iostream>

using namespace cppnet;

int main() {
  HttpServer server;
  auto rc = server.Init({"127.0.0.1", 8080});
  if (rc != kSuccess) {
    std::cout << "init server wrong " << server.err_msg() << std::endl;
    return rc;
  }
  server.GET("/", [](HttpContext &ctx) {
    ctx.resp().Success(HttpHeader::ContentType::kTextHtml,
                       "<h1>Hello, World!</h1>");
  });
  rc = server.Run();
  if (rc != kSuccess) {
    std::cout << "run server wrong " << server.err_msg() << std::endl;
    return rc;
  }
  return 0;
}
```
3. 编写编译文件
	1. 如果是使用 CMake 编译, 需要在CMakeLists 添加如下内容 , 实际上就是加上了链接库
	```cmake
	# 是否使用ssl都需要添加
	link_directories(./cppnet/lib)
	link_libraries(-lcppnet)
	
	# **如果使用的是 ssl版本并且需要使用ssl的功能,才需要添加下面的**
	add_definitions(-DCPPNET_OPENSSL)
	link_libraries(-lssl -lcrypto)
	```
	2. 如果是使用 Makefile 编译, 需要在编译选项中添加 `-L./cppnet/lib` 和 `-lcppnet`, 下面是一个 Makefile 编译 demo, 当然如果是ssl的编译也是同理添加 lib 库 和 **添加 PPNET_OPENSSL 宏**
	```Makefile
	all: libserver-makefile
	
	libserver-makefile:
		g++ -O2 -Wall -std=c++17 ./main.cpp -o libserver-makefile -lcppnet -L./cppnet/lib
	```
4. 执行编译, 获得编译的文件就成功了
