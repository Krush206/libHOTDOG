all:
	$(MAKE) -C lib
	$(MAKE) -C linux
	$(MAKE) -C objects
	ar q libhotdog.a lib/*.o objects/*.o linux/*.o

clean:
	$(MAKE) -C lib clean
	$(MAKE) -C linux clean
	$(MAKE) -C objects clean
	rm -f ./libhotdog.a
