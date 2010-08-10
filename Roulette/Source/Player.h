//
//  Player.h
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Table;

@interface Player : NSObject {
	NSNumber *money;
	NSString *name;
	NSNumber *gamblerID;
	Table *currentTable;
}
 
@property (nonatomic, assign) NSNumber *money;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSNumber *gamblerID;
@property (nonatomic, assign) Table *currentTable;

- (id) initWithID:(int)idnumber Name:(NSString *)givenName money:(double)initialMoney;
- (void) placeBetOfValue:(double)value forOption:(int)option;
- (void) receiveEarnings:(double) earnings;
- (NSString *)spinResult;
@end
