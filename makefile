default: all

CXX := g++

# build flags, debug options:
#-DLRS_QUIET <- comment that guy for debugging
CFLAGS := -g -Wall
#

SRCDIR := ./src/

LIBDIR := ./lib/

BINDIR := ./bin/

TSTDIR := ./test/

CFLAGS := -g -O3 -Wall

INCLUDES := -I$(LIBDIR) -I$(SRCDIR)

FASTOBJ := public_interface.o ball_walker.o dikin_walker.o vaidya_walker.o

public_interface.o: $(SRCDIR)public_interface.cpp $(SRCDIR)public_interface.hpp
	$(CXX)   ${CFLAGS} $(INCLUDES) -c $(SRCDIR)public_interface.cpp -o $(LIBDIR)public_interface.o

ball_walker.o: $(SRCDIR)ball_walker.cpp $(SRCDIR)ball_walker.hpp
	$(CXX)   ${CFLAGS} $(INCLUDES) -c $(SRCDIR)ball_walker.cpp -o $(LIBDIR)ball_walker.o

dikin_walker.o: $(SRCDIR)dikin_walker.cpp $(SRCDIR)dikin_walker.hpp
	$(CXX)   ${CFLAGS} $(INCLUDES) -c $(SRCDIR)dikin_walker.cpp -o $(LIBDIR)dikin_walker.o

vaidya_walker.o: $(SRCDIR)vaidya_walker.cpp $(SRCDIR)vaidya_walker.hpp
	$(CXX)   ${CFLAGS} $(INCLUDES) -c $(SRCDIR)vaidya_walker.cpp -o $(LIBDIR)vaidya_walker.o

driver: $(SRCDIR)polytopedriver.cpp $(FASTOBJ)
		$(CXX)   ${CFLAGS} $(INCLUDES) -c $(SRCDIR)polytopedriver.cpp -o $(BINDIR)driver

clean:
	cd $(LIBDIR) && rm -f *.o
	cd $(BINDIR) && rm -f *.exe driver

all: clean $(FASTOBJ) driver
