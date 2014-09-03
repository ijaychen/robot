/*************************************************************************
	> File Name: dispatcher.cpp
	> Author: cjj
	> Created Time: Thu 10 Jul 2014 01:36:36 PM CST
 ************************************************************************/
#include <sys/socket.h>
#include <sys/epoll.h>
#include <assert.h>
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include "dispatcher.h"
#include "../client.h"
#include "timer.h"

Dispatcher* g_dispatcher = NULL;

Dispatcher::Dispatcher() : m_epfd(-1), m_nWaitTime(500)
{
	assert(g_dispatcher == NULL);
	m_epfd = epoll_create(9999);
	assert(m_epfd > 0);
	g_dispatcher = this;
}

Dispatcher::~Dispatcher()
{	
	close(m_epfd);
	g_dispatcher = NULL;
}

void Dispatcher::Dispatch()
{
	//epoll_wait
	int n = 0;
	while(true)
	{
		TimerManager * g_timerManager = TimerManager::GetInstance();
		g_timerManager->Tick();
		n = epoll_wait(m_epfd, m_events, MAX_EVENT_SIZE, m_nWaitTime);
		if(0 > n){
			//error
		}
		else if(0 == n){
			//timeout
		}
		else{
			for(int i = 0; i < n; ++i)
			{
				Client * evobj = static_cast<Client*>(m_events[i].data.ptr);
				if((m_events[i].events & EPOLLIN) | (m_events[i].events & EPOLLERR)){
					evobj->OnEventReadable();
				}
				if(m_events[i].events & EPOLLOUT){
					evobj->OnEventWriteable();
				}
			}
		}
			
	}	
}
