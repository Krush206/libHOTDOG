CC = gcc
OPT = -O2

CFLAGS = -I../include -I/usr/GNUstep/Local/Library/Headers \
	 -fconstant-string-class=NSString -std=c99 \
	 -DBUILD_FOR_LINUX=1 -DBUILD_FOUNDATION=1
