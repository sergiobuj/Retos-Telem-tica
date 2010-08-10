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

- (id) initWithID:(int)idnumber Name:(NSString *)givenName money:(int)initialMoney{
	if( self = [super init]){
		self.name = givenName;
		self.money = [NSNumber numberWithInt:initialMoney];
		self.gamblerID = [NSNumber numberWithInt:idnumber];
	}
	return self;
}

- (int) placeBetOfValue:(int)value forOption:(int)option{
	int success = 0;
	Bet * newBet = [[Bet alloc] initByGambler:self withValue:[NSNumber numberWithInt:value] forOption:option];
	[self.currentTable placeBet:newBet];
	
	int newMoney = [self.money intValue] - value;
	self.money = [NSNumber numberWithInt:newMoney];
	
	[newBet release];
	return success;
}

- (void)setCurrentTable:(Table *)newTable{
	if (self.currentTable == nil) {
		self.currentTable = newTable;
	}
}

- (void) receiveEarnings:(int)earnings {
	if (earnings > 0) {
		earnings += [self.money intValue];
		self.money = nil;
		self.money = [NSNumber numberWithInt:earnings];
	}	
}


- (NSString *)description{
	return [NSString stringWithFormat:@"%@ has $%@, table assign:%@",self.name, self.money, (self.currentTable != nil)? @"YES": @"NO"];
}


- (void) dealloc{
	[name release];
	[gamblerID release];
	[currentTable release];
	[super dealloc];
}
@end
