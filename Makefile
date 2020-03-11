DEBUG = 0
CPP = g++
EXEC = libtins_sniff_example
CFLAGS = -Wall -std=c++11
LDFLAGS = -Wl,-rpath,/usr/local/lib
COMMON += -I/usr/local/include
LDLIBS += -ltins

UNAME := $(shell uname)

OBJS = main.o

ifeq ($(DEBUG), 1)
CFLAGS += -O0 -g -DDEBUG=1
endif

ifeq ($(UNAME), Darwin)
LDFLAGS += -L/usr/local/Cellar/libtins/4.2_1/lib
else
LDFLAGS += -L/uusr/local/lib
endif

.PHONY: all clean

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CPP) $(COMMON) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(LDLIBS)

%.o: %.cpp
	$(CPP) $(COMMON) $(CFLAGS) -c $< -o $@ 

clean:
	rm -rf $(EXEC) $(OBJS)
