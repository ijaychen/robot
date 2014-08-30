/*************************************************************************
	> File Name: test.cpp
	> Author: cjj
	> Created Time: Fri 29 Aug 2014 09:48:03 AM CST
 ************************************************************************/
#include <string.h>
#include <iostream>

using namespace std;

int main()
{
	char buf[256] = {0};
	char ch = 0;
	memcpy(buf, (char*)&ch, 1);
	return 0;
}
