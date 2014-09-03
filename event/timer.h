/*************************************************************************
	> File Name: timer.h
	> Author: cjj
	> Created Time: Tue 02 Sep 2014 12:00:07 PM CST
 ************************************************************************/
#ifndef TIMER_H
#define TIMER_H

#include <map>
#include "../include/global.h"
//#include "../client.h"
class Client;
typedef void (Client::*cb_func_t)();

class Timer
{
public:
	Timer(uint32_t expire, Client * cln, cb_func_t func) 
		: m_step(expire), m_expire(time(NULL) + expire), m_pClient(cln), cb_func(func)
	{}
	
	uint32_t GetExpire() const
	{
		return m_expire;
	}
	
	void Update()
	{
		m_expire += m_step;
	}
	
	void Run()
	{
		if(m_pClient)
		{
			(m_pClient->*cb_func)();
		}
	}
private:	
	uint32_t m_step;
	uint32_t m_expire;
	Client * m_pClient;
	cb_func_t cb_func;
};

class TimerManager
{
public:
	virtual ~TimerManager()
	{
		m_timerList.clear();
	}
	static TimerManager * GetInstance()
	{
		static TimerManager _instance;
		return &_instance;
	}

	void InsertTimer(Timer * timer)
	{
		if(!timer) return;
		uint32_t expire = timer->GetExpire();
		m_timerList.insert(std::pair<uint32_t, Timer*>(expire, timer));
	}
	
	void RemoveTimer(std::multimap<uint32_t, Timer *>::iterator iter)
	{
		m_timerList.erase(iter);
	}
	
	void Tick()
	{		
		std::multimap<uint32_t, Timer *>::iterator iter;
		for(iter = m_timerList.begin(); iter!= m_timerList.end(); ++iter)
		{
			int curTime = time(NULL);
			if(iter->first > curTime) {
				return ;
			}
			Timer * timer = iter->second;
			timer->Run();
			timer->Update();
			RemoveTimer(iter);
			InsertTimer(timer);
		}
	}
	
private:
	TimerManager(){}	
private:
	std::multimap<uint32_t, Timer *> m_timerList;
};

#endif
