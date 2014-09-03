/*************************************************************************
	> File Name: circular_buffer.h
	> Author: cjj
	> Created Time: Thu 28 Aug 2014 09:23:02 AM CST
 ************************************************************************/
#ifndef CIRCULAR_BUFFER_H
#define CIRCULAR_BUFFER_H

#include <iostream>

class CircularBuffer
{
public:
	CircularBuffer(size_t size) : buf(new char[2 * size]), 
				m_max(size), m_q(0), m_b(0), m_t(0), m_count(0){
	}

	~CircularBuffer(){
		delete[] buf;
	}
	
	bool Write(const char *s,size_t l){
		int index = 0; 
		if (m_q + l > m_max)
		{
			printf("write overflow\n");
			return false; // overflow
		}
		m_count += (unsigned long)l;
		if (m_t + l > m_max) // block crosses circular border
		{
			size_t l1 = m_max - m_t; 
			memcpy(buf + m_t, s, l);
			memcpy(buf, s + l1, l - l1);
			m_t = l - l1;
			m_q += l;
		}
		else
		{
			memcpy(buf + m_t, s, l);
			memcpy(buf + m_max + m_t, s, l);
			m_t += l;
			if (m_t >= m_max)
				m_t -= m_max;
			m_q += l;
		}
		return true;
	}
	
	bool Read(char *dest,size_t l){
		if (l > m_q)
		{
			return false; 
		}
		if (m_b + l > m_max) // block crosses circular border
		{
			size_t l1 = m_max - m_b;
			if (dest)
			{
				memcpy(dest, buf + m_b, l1);
				memcpy(dest + l1, buf, l - l1);
			}
			m_b = l - l1;
			m_q -= l;
		}
		else
		{
			if (dest)
			{
				memcpy(dest, buf + m_b, l);
			}
			m_b += l;
			if (m_b >= m_max)
				m_b -= m_max;
			m_q -= l;
		}
		if (!m_q)
		{
			m_b = m_t = 0;
		}
		return true;
	}
	
    bool SoftRead(char *dest, size_t l){
	    if (l > m_q)
		{
			return false;
		}
		if (m_b + l > m_max)                          // block crosses circular border
		{
			size_t l1 = m_max - m_b;
			if (dest)
			{
				memcpy(dest, buf + m_b, l1);
				memcpy(dest + l1, buf, l - l1);
			}
		}
		else
		{
			if (dest)
			{
				memcpy(dest, buf + m_b, l);
			}
		}
		return true;
	}
	
	size_t GetLength(){
		return m_q;
	}
private:
	CircularBuffer(const CircularBuffer& s) {}
	CircularBuffer& operator=(const CircularBuffer& ) { return *this; }
	char *buf;
	size_t m_max;
	size_t m_q;
	size_t m_b;
	size_t m_t;
	unsigned long m_count;
};
#endif
