include common.mk

LIBS = ./lib/lib.o ./linux/linux.o ./objects/objects.o

all:
	$(MAKE) -C ./lib
	$(MAKE) -C ./linux
	$(MAKE) -C ./objects
	ar q ./libHOTDOG.a $(LIBS)

clean:
	$(MAKE) -C ./lib clean
	$(MAKE) -C ./linux clean
	$(MAKE) -C ./objects clean
	rm -f ./libHOTDOG.a
