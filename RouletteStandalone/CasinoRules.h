//
//  CasinoRules.h
//  Roulette
//
//  Created by Sergio Botero on 8/9/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <Cocoa/Cocoa.h>

enum kColor {
	kNoColor = -1,
	kRedColor = 0,
	kBlackColor = 1
	
};

@interface CasinoRules : NSObject {
}

+ (int) getColorForNumber:(int)number;

@end
