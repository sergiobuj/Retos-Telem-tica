//
//  Player.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Player.h"

@implementation Player
@synthesize money, name, gamblerID, tableID;

// A player decides to go to a Casino...
- (id) initWithID:(int)idnumber Name:(NSString *)givenName money:(double)initialMoney{
	if( self = [super init]){
		self.name = givenName;
		self.money = initialMoney;
		self.gamblerID = idnumber;
	}
	return self;
}

- (void) collect:(double) income{
	self.money += income;
}

- (NSString *) spinResult{
	return [NSString stringWithFormat:@"%@ tiene $%lf",self.name, self.money];
}

- (NSString *) description{
	return [NSString stringWithFormat:@"%d %@ tiene $%lf, tiene mesa:%@", gamblerID, self.name, self.money, (tableID != 0)? @"SI": @"NO"];
}

//
- (void) dealloc{
	[name release];
	[super dealloc];
}
@end
