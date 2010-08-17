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

@implementation Table
@synthesize payouts, bets, tableID ;

// Buy a Roulette
- (id) initWithID:(int)idTable{
	if (self = [super init]) {
		self.tableID = idTable;
		bets = [[NSMutableArray alloc] init];
	}
	return self;
}

#pragma mark GamePlay methods

// A new bet was placed on the table
- (void) receiveBetFromGambler:(int)gamblerID forValue:(double)value toOption:(int) option{
	Bet *newBet = [[Bet alloc] initByGambler:gamblerID withValue:value forOption:option];
	[self.bets addObject:newBet];
	[newBet release];
}

// pay bets on table
- (void) payBetsToResult:(int)result{

	for( Bet * currentBet in bets){
		int currentOption = [currentBet option];
		double payout = 0;
		switch (currentOption) {

			case kRedOption:
				if (kRedColor == [CasinoRules getColorForNumber:result]){
					payout = ( [currentBet value] / 18.0 ) * 36.0;
				}
				break;

			
			case kBlackOption:
				if (kBlackColor == [CasinoRules getColorForNumber:result]){
					payout = ( [currentBet value] / 18.0 ) * 36.0;
				}
				break;
				
				
			case kEvenOption:
				if ( result % 2 == 0 ){
					payout = ( [currentBet value] / 18.0 ) * 36.0;
				}
				break;
				
				
			case kOddOption:
				if ( result % 2 != 0 ){
					payout = ( [currentBet value] / 18.0 ) * 36.0;
				}
				break;
		
				
			default:
				if( currentOption <= 37 && currentOption >=0 && currentOption == result){
					payout = [currentBet value] * 36.0;
					
				}// else, invalid number!
				break;
		}
		
		[payouts setObject:[NSNumber numberWithDouble:payout] forKey:[NSString stringWithFormat:@"%d",[currentBet gamblerID]]];
		
	}

	[bets removeAllObjects];

}

// Spin It!!!!
- (void) spinTheWheel{
	if ([bets count] != 0) {
		[payouts removeAllObjects];
		int result = SSRandomIntBetween(0, 37);
		[self payBetsToResult:result];
		printf("Resultado ruleta: %d", result);

	}		
	
}

- (NSString *)description{
	return [NSString stringWithFormat:@"Mesa:%d con:%d apuesta(s)",tableID ,[bets count]];
}

-(void) dealloc{
	[bets release];
	[super dealloc];
}
@end
