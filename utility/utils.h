#ifndef BASE_NET_UTILS_H
#define BASE_NET_UTILS_H

#include <arpa/inet.h>
#include <string>

// 解析ipaddr与port至sockaddr_in中
void convert_sockaddr(sockaddr_in* addr, const char* ipaddr, int port);

// 设置fd为非阻塞模式
void make_fd_nonblocking(int fd);

// 获取可读ip地址字符串与端口
void getpeername(int fd, std::string* ip, int* port);

// 将二进制数据转为可读的字符串
std::string dump_raw_data(const char* raw, uint32_t count);
#endif
