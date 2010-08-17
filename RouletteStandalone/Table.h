//
//  Table.h
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Table : NSObject {
	NSMutableDictionary *payouts; // List of gamblers playing on the table
	NSMutableArray *bets;     // List of bets placed on the table for the next game
	int tableID;        // Unique number for the table

}

@property (nonatomic, retain) NSMutableDictionary *payouts;
@property (nonatomic, retain) NSMutableArray *bets;
@property (nonatomic) int tableID;

- (id) initWithID:(int)idTable;
- (void) receiveBetFromGambler:(int)gamblerID forValue:(double)value toOption:(int) option;
- (void) payBetsToResult:(int)result;
- (void) spinTheWheel;
@end
