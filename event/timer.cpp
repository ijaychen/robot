/*************************************************************************
	> File Name: timer.cpp
	> Author: cjj
	> Created Time: Tue 02 Sep 2014 12:03:04 PM CST
 ************************************************************************/
#include "timer.h"
/*
void TimerManager::InsertTimer(Timer * timer)
{
	if(!timer) return;
	uint32_t expire = timer->GetExpire();
	m_timerList.insert(expire, timer);
}

void TimerManager::RemoveTimer(std::multimap<uint32_t, Timer *>::iterator iter)
{
	m_timerList.erase(iter);
}

void TimerManager::Tick()
{
	std::multimap<uint32_t, Timer *>::iterator iter;
	for(iter = m_timerList.begin(); iter!= m_timerList.end(); ++iter)
	{
		int curTime = time(NULL);
		if(iter->first < curTime) return;
		Timer * timer = iter->second;
		timer->Run();
		timer->Update();
		RemoveTimer(iter);
		InsertTimer(timer);
	}	
}
*/