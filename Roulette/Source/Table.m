//
//  Table.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Table.h"
#import <ScreenSaver/ScreenSaver.h>
#import "Bet.h"
#import "CasinoRules.h"
#import "Player.h"

@implementation Table
@synthesize gamblers, bets, tableName, tableID ;

- (id) initWithID:(NSNumber *)idTable{
	if (self = [super init]) {
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

	for( Bet * currentBet in bets){
		int currentOption = [currentBet option];
		int payout = 0;
		switch (currentOption) {

			case kRedOption:
				if (kRedColor == [CasinoRules getColorForNumber:result]){
					payout = ( [[currentBet valueOfBet] intValue] / 18.0 ) * 36.0;
				}
				break;

			
			case kBlackOption:
				if (kBlackColor == [CasinoRules getColorForNumber:result]){
					payout = ( [[currentBet valueOfBet] intValue] / 18.0 ) * 36.0;
				}
				break;
				
				
			case kEvenOption:
				if ( result % 2 == 0 ){
					payout = ( [[currentBet valueOfBet] intValue] / 18.0 ) * 36.0;
				}
				break;
				
				
			case kOddOption:
				if ( result % 2 != 0 ){
					payout = ( [[currentBet valueOfBet] intValue] / 18.0 ) * 36.0;
				}
				break;
		
				
			default:
				if( currentOption <= 37 && currentOption >=0 && currentOption == result){
					payout = [[currentBet valueOfBet] intValue] * 36.0;
					
				}// else, invalid number!
				break;
		}
		
		[currentBet.gamblerID receiveEarnings:payout];
	}
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
