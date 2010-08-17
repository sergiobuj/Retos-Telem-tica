//
//  Bet.h
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define kRedOption 38
#define kBlackOption 39
#define kOddOption 40
#define kEvenOption 41

@interface Bet : NSObject {
	int gamblerID;
	int option;	
	double value;

}

@property (nonatomic) int option;
@property (nonatomic) int gamblerID;
@property (nonatomic) double value;

- (id) initByGambler:(int)gambler withValue:(double)valueOfBet forOption:(int)betOption;

@end
