DEBUG = 0
CC = gcc
EXEC = main
CFLAGS = -Wall -std=c++11
LDFLAGS = -Wl,-rpath,/usr/local/lib
COMMON +=
LDLIBS +=

OBJS = main.o

ifeq ($(DEBUG), 1)
CFLAGS += -O0 -g -DDEBUG=1
endif

.PHONY: all clean

all: $(EXEC)

$(EXEC): $(OBJS)
	$(CC) $(COMMON) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(LDLIBS)

%.o: %.c
	$(CC) $(COMMON) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(EXEC) $(OBJS)
