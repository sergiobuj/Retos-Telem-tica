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

+ (void) onBusiness{
	int numTables = 0;
//	int numGamblers = 0;
	Table *firstTable = [[Table alloc] initWithID:[NSNumber numberWithInt:numTables]];
	[firstTable payBetsToResult:0];
}

@end
