
CC = gcc
TARGET = ta
CFLAGS = -L./ -I./lib -Wall 
LDFLAGS = -lta -lm

all:	libs src

libs:
	$(CC) -c -Wall -fpic lib/libta.c
	$(CC) -shared -o libta.so libta.o

src:	libs
	$(CC) $(CFLAGS) -o ta src/ta.c $(LDFLAGS)
	
test: libs
	@./mktests.sh

clean:
	rm *.o *.so $(TARGET) *.mt tests/*.c tests/test*
