//
//  Bet.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Bet.h"


@implementation Bet
@synthesize gamblerID, valueOfBet, option;


// Create a bet!
- (id) initByGambler:(Player *)gambler withValue:(NSNumber *)value forOption:(int) betOption{
	if (self = [super init]) {
		self.gamblerID = gambler;
		self.valueOfBet = value;
		self.option = betOption;
	}
	return self;
}

-(void) dealloc{
	[gamblerID release];
	[valueOfBet release];
	[super dealloc];
}
@end
