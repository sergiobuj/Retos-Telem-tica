#import <Foundation/Foundation.h>
#import "Casino.h"

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	[Casino onBusiness];
    [pool drain];
    return 0;
}
