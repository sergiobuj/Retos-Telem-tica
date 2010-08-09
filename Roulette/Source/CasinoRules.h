//
//  CasinoRules.h
//  Roulette
//
//  Created by Sergio Botero on 8/9/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum betOptions {
	kBet0 = 0,
	kBet1, kBet2, kBet3, kBet4,	kBet5,	kBet6,	kBet7,	kBet8,	kBet9,	kBet10,	kBet11,
	kBet12,	kBet13,	kBet14,	kBet15,	kBet16,	kBet17,	kBet18,	kBet19,	kBet20,	kBet21,	kBet22,
	kBet23,	kBet24,	kBet25,	kBet26,	kBet27,	kBet28,	kBet29,	kBet30,	kBet31,	kBet32,	kBet33,
	kBet34,	kBet36, kBet00,	kBetRed, kBetBlack, kBetEven, kBetOdd	
};

enum kColor {
	kRedColor = 0,
	kBlackColor
};

@interface CasinoRules : NSObject {
}

+ (NSArray *) arrayOfColors;
@end
