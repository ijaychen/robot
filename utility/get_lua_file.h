/*************************************************************************
	> File Name: get_lua_file.h
	> Author: cjj
	> Created Time: Mon 25 Aug 2014 02:34:20 PM CST
 ************************************************************************/
#ifndef GET_LUA_FILE_H
#define GET_LUA_FILE_H

#include <string.h>
#include <sys/types.h>
#include <dirent.h>
#include <sys/stat.h>
#include <string>
#include <vector>
#include <iostream>

static void trave_dir(std::vector<std::string> &filename, const char* path, const char * format)
{
	DIR *d; 
	struct dirent *file; 
	struct stat sb;    
	if(!(d = opendir(path)))
	{
		return ;
	}
	while((file = readdir(d)) != NULL)
	{
		if(strncmp(file->d_name, ".", 1) == 0)
			continue;
		int res = stat(file->d_name, &sb);
		if(S_ISDIR(sb.st_mode))
		{
			char strDir[256] = {0};
			strcpy(strDir, path);
			strcat(strDir, "/");
			strcat(strDir, file->d_name);
			trave_dir(filename, strDir, format);
		}
		else
		{
			int size = strlen(file->d_name);
			int format_size = strlen(format);
			if(format_size > size) continue;
			if(strcmp((file->d_name + size - format_size), format) != 0) continue;
			std::string str;
			str += path; 
			str += "/"; 
			str += file->d_name; 
			filename.push_back(str);
		}
	}
	closedir(d);
}

static void get_lua_file(std::vector<std::string> & filename, const char * path)
{	
	trave_dir(filename, path, ".lua");
}

#endif