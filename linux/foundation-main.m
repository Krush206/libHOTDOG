#import "HOTDOG.h"
#import "HOTDOG-lib.h"
#import "HOTDOG-linux.h"
#import "HOTDOG-objects.h"

@interface CustomDiskIcon: AtariSTDiskIcon
- (void) handleDoubleClick;
@end

@interface CustomWindow: AtariSTWindow
{
  id _diskIcon, _window;
  Int4 _diskRect;
}

- (void) handleMouseDown: (id) event;
- (void) drawInBitmap: (id) bitmap rect: (Int4) r context: (id) context;
@end

@implementation CustomDiskIcon
- (void) handleDoubleClick
{
  printf("OK\n");
}
@end

@implementation CustomWindow
- (id) init
{
  self = [super init];
  if(self != nil)
  {
    _diskIcon = [@"CustomDiskIcon" asInstance];
    [_diskIcon setValue: @"OK" forKey: @"path"];
    _diskRect.w = [_diskIcon preferredWidth] / 2;
    _diskRect.h = [_diskIcon preferredHeight];
    _diskRect.x = 50;
    _diskRect.y = 50;
  }
  return self;
}

- (void) handleMouseDown: (id) event
{
  int mouseX, mouseY;

  mouseX = [event intValueForKey: @"mouseX"];
  mouseY = [event intValueForKey: @"mouseY"];
  [super handleMouseDown: event];
  if([Definitions isX: mouseX y: mouseY insideRect: _diskRect])
    [_diskIcon handleMouseDown: event];
  else
    [_window setNilValueForKey: @"isSelected"];
}

- (void) drawInBitmap: (id) bitmap rect: (Int4) r context: (id) context
{
  [super drawInBitmap: bitmap rect: r context: context];
  [_diskIcon drawInBitmap: bitmap rect: _diskRect context: context];
}
@end

int main(void)
{
  id windowManager, atariWindow, window, pool, diskIcon;
  
  pool = [[NSAutoreleasePool alloc] init];
  HOTDOG_initialize_stdout(stdout);
  HOTDOG_initialize(stderr);
  [windowManager = [@"WindowManager" asInstance] setupX11];
  atariWindow = [@"CustomWindow" asInstance];
  window = [windowManager openWindowForObject: atariWindow
                          x: 0
                          y: 0
                          w: 500
                          h: 500];
  [atariWindow setValue: window forKey: @"window"];
  [windowManager runLoop];
  [pool drain];
}
