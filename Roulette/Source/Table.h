//
//  Table.h
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Bet;

@interface Table : NSObject {
	NSMutableArray *gamblers; // List of gamblers playing on the table
	NSMutableArray *bets;     // List of bets placed on the table for the next game
	NSString *tableName;      // Name of the table
	NSNumber *tableID;        // Unique number for the table

}
@property (nonatomic, retain) NSString *tableName;
@property (nonatomic, copy) NSMutableArray *gamblers;
@property (nonatomic, copy) NSMutableArray *bets;
@property (nonatomic, assign) NSNumber *tableID;

- (id) initWithID:(NSNumber *)idTable;
- (void) placeBet:(Bet *)newBet;
- (void) removeBets;
- (void) payBetsToResult:(int)result;
- (void) spinTheWheel;
@end
