#include "utils.h"
#include <cstring>
#include <cerrno>
#include <fcntl.h>
#include "../logger.h"

using namespace std;

void convert_sockaddr(sockaddr_in* addr, const char* ipaddr, int port)
{
	memset(addr, 0, sizeof(struct sockaddr_in));
	addr->sin_family = AF_INET;
	if (strcmp(ipaddr, "*") == 0 || strcmp(ipaddr, "any") == 0) {
		addr->sin_addr.s_addr = INADDR_ANY;
	} else {
		inet_aton(ipaddr, &(addr->sin_addr));
	}
	addr->sin_port = htons(port);
}

// 设置fd为非阻塞模式
void make_fd_nonblocking(int fd)
{
	int opts = fcntl(fd, F_GETFL);
	errno_assert(opts != -1);

	opts = opts | O_NONBLOCK;
	int rc = 0;
	rc = fcntl(fd, F_SETFL, opts);
	errno_assert(rc != -1);
}

void getpeername(int fd, std::string* ip, int* port)
{
	sockaddr_in addr;
	socklen_t len = sizeof(addr);
	::getpeername(fd, (sockaddr*)&addr, &len);

	*ip = inet_ntoa(addr.sin_addr);
	*port = addr.sin_port;
}

string dump_raw_data(const char* raw, uint32_t count)
{
	std::string ret;
	for (uint32_t i = 0; i < count; ++i) {
		utils::string_append_format(ret, "%u,", (uint32_t)((uint8_t)(*(raw + i))));
	}
#ifdef HAS_CXX11
	return move(ret);
#else
	return ret;
#endif
}
