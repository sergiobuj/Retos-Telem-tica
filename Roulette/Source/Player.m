//
//  Player.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Player.h"
#import "Bet.h"
#import "Table.h"

@implementation Player
@synthesize money, name, gamblerID, currentTable;

// A player decides to go to a Casino...
- (id) initWithID:(int)idnumber Name:(NSString *)givenName money:(double)initialMoney{
	if( self = [super init]){
		self.name = givenName;
		self.money = [NSNumber numberWithDouble:initialMoney];
		self.gamblerID = [NSNumber numberWithInt:idnumber];
	}
	return self;
}


// Place a bet on the current table
- (void) placeBetOfValue:(double)value forOption:(int)option{
	Bet * newBet = [[Bet alloc] initByGambler:self withValue:[NSNumber numberWithDouble:value] forOption:option];
	[currentTable receiveBet:newBet];
	
	double newMoney = [self.money doubleValue] - value;
	self.money = [NSNumber numberWithDouble:newMoney];
	
	[newBet release];

}

// Receive earnings of bet, if any ;)
- (void) receiveEarnings:(double)earnings {
	if (earnings > 0) {
		earnings += [self.money doubleValue];
		self.money = nil;
		self.money = [NSNumber numberWithDouble:earnings];
	}	
}

- (NSString *)spinResult{
	return [NSString stringWithFormat:@"%@ tiene $%@",self.name, self.money];
}
- (NSString *)description{
	return [NSString stringWithFormat:@"%d %@ tiene $%f, tiene mesa:%@",[gamblerID intValue], self.name, [self.money doubleValue], (currentTable != nil)? @"YES": @"NO"];
}

//
- (void) dealloc{
	[name release];
	[gamblerID release];
	[currentTable release];
	[super dealloc];
}
@end
