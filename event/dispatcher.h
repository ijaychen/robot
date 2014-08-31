/*************************************************************************
	> File Name: dispatcher.h
	> Author: cjj
	> Created Time: Thu 10 Jul 2014 01:28:13 PM CST
 ************************************************************************/
#ifndef DISPATCHER_H
#define DISPATCHER_H

#include <map>

class Client;

class Dispatcher
{
public:
	static Dispatcher * GetInstance()
	{
		static Dispatcher _instance;
		return &_instance;
	}
	
	~Dispatcher();
	
	int GetDispatchfd() const { return m_epfd; }
	void AddIofd(int fd, Client* event){
		//m_event_io_list.insert(fd, event);
	}
	
	void Dispatch();
private:
	Dispatcher();
	
private:
	int m_nWaitTime;
	int m_epfd;
	
	const static int MAX_EVENT_SIZE = 512;
	epoll_event m_events[MAX_EVENT_SIZE];
	std::map<int, Client*> m_event_io_list;
};

extern Dispatcher* g_dispatcher;
#endif
