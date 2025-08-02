include ../common.mk

CFLAGS = -I. -I.. -I../objects -I../linux \
	 -I/usr/GNUstep/Local/Library/Headers \
	 -fconstant-string-class=NSConstantString \
	 -std=c99 -DBUILD_FOR_LINUX=1 -DBUILD_FOUNDATION=1

SRC = graphics-ataristfont.m \
      graphics-c64font.m \
      graphics-cards.m \
      graphics-chat.m \
      graphics-chicagofont.m \
      graphics-finalfantasy6font.m \
      graphics-genevafont.m \
      graphics-monacofont.m \
      graphics-topazfont.m \
      graphics-winsystemfont.m \
      lib-Bitmap.m \
      lib-Definitions.m \
      lib-NSArray.m \
      lib-NSData.m \
      lib-NSDictionary.m \
      lib-NSMutableArray.m \
      lib-NSMutableDictionary.m \
      lib-NSObject.m \
      lib-NSString.m \
      lib-SEL-emptyTrash.m \
      lib-SEL-moveToTrash.m \
      lib-SEL-showAlert.m \
      lib-color.m \
      lib-csv.m \
      lib-date.m \
      lib-file.m \
      lib-handlers.m \
      lib-ivar.m \
      lib-namespace.m \
      lib-objc.m \
      lib-pixelscaling.m \
      lib-process.m \
      lib-processwitherror.m \
      lib-script.m \
      lib-time.m
OBJ = $(SRC:.m=.o)

all: $(OBJ)

%.o: %.m
	$(CC) -c $(CFLAGS) $(OPT) $<

clean:
	rm -f ./*.o
