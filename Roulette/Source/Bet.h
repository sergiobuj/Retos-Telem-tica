//
//  Bet.h
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class Player;
#define kRedOption 38
#define kBlackOption 39
#define kOddOption 40
#define kEvenOption 41

@interface Bet : NSObject {
	Player *gamblerID;
	NSNumber *valueOfBet;
	int option;	
}

@property (nonatomic, assign) Player *gamblerID;
@property (nonatomic, assign) NSNumber *valueOfBet;
@property (nonatomic) int option;

- (id) initByGambler:(Player *)gambler withValue:(NSNumber *)value forOption:(int) betOption;

@end
