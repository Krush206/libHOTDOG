#import "HOTDOG.h"
#import "HOTDOG-lib.h"
#import "HOTDOG-linux.h"
#import "HOTDOG-objects.h"

@interface CustomDiskIcon: AtariSTDiskIcon
{
  Int4 _rect, *_rectPtr;
}

- (id) init;
- (void) handleMouseDown: (id) event;
- (void) handleDoubleClick;
@end

@interface CustomWindow: AtariSTWindow
{
  id _obj;
  unsigned int _total;
}

- (id) init;
- (void) handleMouseDown: (id) event;
- (void) drawInBitmap: (id) bitmap rect: (Int4) r context: (id) context;
@end

@implementation CustomDiskIcon
- (id) init
{
  self = [super init];
  if(self != nil)
  {
    _rect.w = [self preferredWidth];
    _rect.h = [self preferredHeight];
    _rectPtr = &_rect;
  }
  return self;
}

- (void) handleMouseDown: (id) event
{
  int mouseX, mouseY;

  mouseX = [event intValueForKey: @"mouseX"];
  mouseY = [event intValueForKey: @"mouseY"];
  if([Definitions isX: mouseX y: mouseY insideRect: _rect])
    [super handleMouseDown: event];
  else
  {
    id x11dict;
    
    x11dict = [event valueForKey: @"x11dict"];
    [x11dict setValue: @"0" forKey: @"isSelected"];
  }
}

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
    id icon;
    Int4 *rect;

    _obj = nsarr();
    icon = [@"CustomDiskIcon" asInstance];
    [icon setValue: @"Test" forKey: @"path"];
    rect = (Int4 *) [icon pointerValueForKey: @"rectPtr"];
    rect->x = 50;
    rect->y = 50;
    [_obj addObject: icon];
    _total = [_obj count];
  }
  return self;
}

- (void) handleMouseDown: (id) event
{
  unsigned int i;

  [super handleMouseDown: event];
  for(i = 0; i < _total; i++)
    [[_obj nth: i] handleMouseDown: event];
}

- (void) drawInBitmap: (id) bitmap rect: (Int4) r context: (id) context
{
  unsigned int i;

  [super drawInBitmap: bitmap rect: r context: context];
  for(i = 0; i < _total; i++)
  {
    id obj;

    obj = [_obj nth: i];
    [obj drawInBitmap: bitmap
         rect: *(Int4 *) [obj pointerValueForKey: @"rectPtr"]
         context: context];
  }
}
@end

int main(void)
{
  id windowManager, atariWindow, window, pool;
  
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
  [windowManager runLoop];
  [pool drain];
}
