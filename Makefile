robot : main.cpp event/dispatcher.cpp
	g++ main.cpp event/dispatcher.cpp -L./ -llua -ldl
