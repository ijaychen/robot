/*************************************************************************
	> File Name: listener.h
	> Author: cjj
	> Created Time: Thu 10 Jul 2014 03:11:17 PM CST
 ************************************************************************/
#ifndef LISTENER_H
#define LISTENER_H

#include <assert.h>
#include "utils.h"
#include "../event/event_io.h"

namespace base{
class Listener : public EventIO
{
public:
	Listener(){}
	virtual ~Listener(){}
	 // 侦听指定地址
	bool Bind(const char* ipaddr, int port)
	{
		sockaddr_in serveraddr;
		convert_sockaddr(&serveraddr, ipaddr, port);

		// 创建侦听套接字
		int listenfd = socket(AF_INET, SOCK_STREAM, 0);

		// 设置socket
		int reuseaddr = 1;
		int rc = 0;
		rc = setsockopt(listenfd, SOL_SOCKET, SO_REUSEADDR, &reuseaddr, sizeof(int));
		assert(rc == 0);

		int sndbuf = 8192;
		rc = setsockopt(listenfd, SOL_SOCKET, SO_SNDBUF, &sndbuf, sizeof(int));
		assert(rc == 0);

		int rcvbuf = 8192;
		rc = setsockopt(listenfd, SOL_SOCKET, SO_RCVBUF, &rcvbuf, sizeof(int));
		assert(rc == 0);

		// 设置为非阻塞模式
		make_fd_nonblocking(listenfd);

		// bind
		rc = ::bind(listenfd, (sockaddr*)&serveraddr, sizeof(struct sockaddr_in));
		assert(rc == 0);

		// listen
		rc = listen(listenfd, 5);
		assert(rc == 0);

		AddToDispatcher(listenfd, EPOLLIN);
		m_fd = listenfd;
		return true;	
	}
	
	void OnAccept(int clientfd)
	{
		AddToDispatcher(clientfd, EPOLLIN | EPOLLOUT);
	}
	
	virtual void OnEventIOReadable()
	{
		while (true) {
		sockaddr_in clientaddr;
		socklen_t clientaddrlen = sizeof(struct sockaddr_in);
		int clientfd = accept(fd(), (sockaddr*)&clientaddr, &clientaddrlen);
		if (clientfd == -1) {
			if (errno == EWOULDBLOCK) {
				break;
			} else {
				//log
				return;
			}
		}
		OnAccept(clientfd);
		}	
	}
	virtual void OnEventIOWriteable(){}
	virtual void OnEventIOClose() {}
};
}

#endif
