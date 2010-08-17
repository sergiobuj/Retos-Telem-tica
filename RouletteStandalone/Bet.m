//
//  Bet.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Bet.h"


@implementation Bet
@synthesize gamblerID, value, option;

- (id) initByGambler:(int)gambler withValue:(double)valueOfBet forOption:(int)betOption{

	if (self = [super init]) {
		
		self.gamblerID = gambler;
		self.value = valueOfBet;
		self.option = betOption;
	}
	return self;
}

-(void) dealloc{
	[super dealloc];
}
@end
