include ./common.mk

LIBS = ./lib/*.o ./linux/*.o ./objects/*.o -lobjc -lX11 -lXext -lGL -lm

all:
	$(MAKE) -C ./lib
	$(MAKE) -C ./linux
	$(MAKE) -C ./objects
	$(CC) -o ./main $(CFLAGS) $(OPT) $(LIBS)

clean:
	$(MAKE) -C ./lib clean
	$(MAKE) -C ./linux clean
	$(MAKE) -C ./objects clean
	rm -f ./main
