//
//  Table.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Table.h"
#import <ScreenSaver/ScreenSaver.h>
#import "CasinoRules.h"

@implementation Table
@synthesize gamblers, bets, tableName, tableID, colors;

- (id) initWithID:(NSNumber *)idTable{
	if (self = [super init]) {
		self.colors = [CasinoRules arrayOfColors];
		self.tableID = idTable;
	}
	return self;
}

#pragma mark GamePlay methods

// places a new bet on the table
- (void) placeBet:(Bet *)newBet{
	[bets addObject:newBet];
}

// removes all bets after a spin
- (void) removeBets{
	[bets removeAllObjects];
}


// pay bets on table
- (void) payBetsToResult:(int)result{
	for(int i = 0; i < [colors count]; i++ )
		NSLog(@"%@", [colors objectAtIndex:i]);

}

// start a new game
- (void) spinTheWheel{
	if ([bets count] != 0) {
		int result = SSRandomIntBetween(0, 37);
		[self payBetsToResult:result];
		[self removeBets];
	}
}

-(void) dealloc{
	[gamblers release];
	[bets release];
	[tableName release];
	[tableID release];
	[super dealloc];
}
@end
