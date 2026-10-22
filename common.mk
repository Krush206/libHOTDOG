CC = gcc
OPT = -O2

# The sources only #import "HOTDOG.h" and rely on the declarations from the
# other headers (method categories, WindowManager interface, object classes).
# Force-include them so the compiler sees the real method signatures instead
# of assuming implicit 'id' returns.
CFLAGS = -I../include -I/usr/GNUstep/Local/Library/Headers \
	 -fconstant-string-class=NSConstantString -std=c99 \
	 -DBUILD_FOR_LINUX=1 -DBUILD_FOUNDATION=1 \
	 -include ../include/HOTDOG-lib.h \
	 -include ../include/HOTDOG-linux.h \
	 -include ../include/HOTDOG-objects.h
