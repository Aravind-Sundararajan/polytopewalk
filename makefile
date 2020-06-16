default: all

CXX := g++

# build flags, debug options:
#-DLRS_QUIET <- comment that guy for debugging
CFLAGS := -g -Wall
#

CFLAGS := -g -O3 -Wall

FASTOBJ := math_functions.o public_interface.o ball_walker.o dikin_walker.o vaidya_walker.o john_walker.o

public_interface.o: public_interface.cpp public_interface.hpp
	$(CXX)   ${CFLAGS} -c public_interface.cpp -o public_interface.o

math_functions.o: math_functions.cpp math_functions.hpp
	$(CXX)   ${CFLAGS} -c math_functions.cpp -o math_functions.o

ball_walker.o: ball_walker.cpp ball_walker.hpp
	$(CXX)   ${CFLAGS} -c ball_walker.cpp -o ball_walker.o

dikin_walker.o: dikin_walker.cpp dikin_walker.hpp
	$(CXX)   ${CFLAGS}  -c dikin_walker.cpp -o dikin_walker.o

vaidya_walker.o: vaidya_walker.cpp vaidya_walker.hpp
	$(CXX)   ${CFLAGS}  -c vaidya_walker.cpp -o vaidya_walker.o

john_walker.o: john_walker.cpp john_walker.hpp
	$(CXX)   ${CFLAGS}  -c john_walker.cpp -o john_walker.o

driver: polytopedriver.cpp
	$(CXX) ${CFLAGS} $(FASTOBJ) polytopedriver.cpp -o driver

clean:
	rm -f *.o driver

all: clean $(FASTOBJ) driver
