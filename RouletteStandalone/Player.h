//
//  Player.h
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Player : NSObject {

	NSString *name;
	double money;
	int gamblerID;
	int tableID;
}
 
@property (nonatomic) double money;
@property (nonatomic) int gamblerID;
@property (nonatomic) int tableID;
@property (nonatomic, copy) NSString *name;

- (id) initWithID:(int)idnumber Name:(NSString *)givenName money:(double)initialMoney;
- (void) collect:(double) income;
- (NSString *)spinResult;

@end
