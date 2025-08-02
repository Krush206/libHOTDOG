include ../common.mk

CFLAGS = -I. -I.. -I../objects -I../lib \
	 -I/usr/GNUstep/Local/Library/Headers \
	 -fconstant-string-class=NSConstantString \
	 -std=c99 -DBUILD_FOR_LINUX=1 -DBUILD_FOUNDATION=1

SRC = foundation-.m \
      foundation-printf.m \
      foundation-qsort_r.m \
      linux-audio.m \
      linux-configDir.m \
      linux-dialog.m \
      linux-execDir.m \
      linux-homeDir.m \
      linux-monitors.m \
      linux-opengl.m \
      linux-x11.m
OBJ = $(SRC:.m=.o)

all: $(OBJ)

%.o: %.m
	$(CC) -c $(CFLAGS) $(OPT) $<

clean:
	rm -f ./*.o
