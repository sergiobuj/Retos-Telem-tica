//
//  Bet.h
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Bet : NSObject {
	NSNumber *gamblerID;
	NSNumber *valueOfBet;
	int option;	
}

@property (nonatomic, assign) NSNumber *gamblerID;
@property (nonatomic, assign) NSNumber *valueOfBet;
@property (nonatomic) int option;

- (id) initByGambler:(NSNumber *)gambler withValue:(NSNumber *)value forOption:(int) betOption;

@end
