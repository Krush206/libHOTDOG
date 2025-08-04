#import "HOTDOG.h"
#import "HOTDOG-lib.h"
#import "HOTDOG-linux.h"
#import "HOTDOG-objects.h"

@interface Drawing: AtariSTWindow
- (void) drawInBitmap: (id) bitmap width: (int) w;
@end

@implementation Drawing
- (void) drawInBitmap: (id) bitmap width: (int) w
{
}
@end

int main(void)
{
  id windowManager, atariWindow, window, pool, bitmap, rectObj;
  Int4 rect;
  
  pool = [[NSAutoreleasePool alloc] init];
  HOTDOG_initialize_stdout(stdout);
  HOTDOG_initialize(stderr);
  [windowManager = [@"WindowManager" asInstance] setupX11];
  atariWindow = [@"AtariSTWindow" asInstance];
  bitmap = [atariWindow valueForKey: @"bitmap"];
  rectObj = [atariWindow valueForKey: @"TitleBarTextRect"];
  rect = *(Int4 *) &rectObj;
  [atariWindow drawInBitmap: [Definitions fitBitmapString: @"OK" width: rect.w] rect: rect];
  window = [windowManager openWindowForObject: atariWindow
                          x: 0
                          y: 0
                          w: 500
                          h: 500];
  [windowManager mapObjectWindow: window];
  [windowManager runLoop];
  [pool drain];
}
