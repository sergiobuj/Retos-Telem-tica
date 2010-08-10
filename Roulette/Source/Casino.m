//
//  Casino.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Casino.h"
#import "Table.h"

@implementation Casino

// The Casino opens for some Roulette...
+ (void) onBusiness{
	
	/* WORK IN PROGRESS
	BOOL closeCasino = FALSE;
	NSMutableArray *tables = [[NSMutableArray alloc] init];
	NSMutableArray *players = [[NSMutableArray alloc] init];
	
	NSAutoreleasePool * newPool;	
	while ( !closeCasino ) {
		newPool = [[NSAutoreleasePool alloc] init];
		char * inputString;
		scanf("%s", inputString);
		NSString *inputStringNS = [[NSString alloc] initWithCString:inputString];
		NSScanner *scanner = [NSScanner scannerWithString:inputStringNS];
		NSString * currentWord;
		while ([scanner isAtEnd] == NO) {
		
		
		
			if([scanner scanUpToString:@" " intoString:&webpage] &&
			   [webpage hasPrefix:@"http://"] &&
			   ![tinyPrefixes containsObject:[[NSURL URLWithString:webpage] host]] ){
				[longWebpages addObject: webpage];
				[pagesLocation addObject:[NSNumber numberWithUnsignedInteger:[scanner scanLocation] - [webpage length] ]];
			}
	 

		
		
		}

		[newPool drain];
	}
	
*/
}

@end
