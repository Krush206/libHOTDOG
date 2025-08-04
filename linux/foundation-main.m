#import "HOTDOG.h"
#import "HOTDOG-lib.h"
#import "HOTDOG-linux.h"
#import "HOTDOG-objects.h"

int main(void)
{
  id windowManager, calculator, window;

  HOTDOG_initialize_stdout(stdout);
  HOTDOG_initialize(stderr);
  [windowManager = [@"WindowManager" asInstance] setupX11];
  calculator = [@"Calculator" asInstance];
  window = [windowManager openWindowForObject: calculator x: 0 y: 0 w: 500 h: 500];
  printf("%p\n", calculator);
  [windowManager mapObjectWindow: window];
  [windowManager runLoop];
}
