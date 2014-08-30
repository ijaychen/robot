/*************************************************************************
	> File Name: utility/log.h
	> Author: cjj
	> Created Time: 2014年08月30日 星期六 09时16分40秒
 ************************************************************************/
#ifndef LOG_H
#define LOG_H

#include <stdio.h>

static void debug_log(const char * msg, const char * debug_level = "WARNING")
{
	printf("%s\t%s\n", debug_level, msg);
}
#endif
