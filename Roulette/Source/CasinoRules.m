//
//  CasinoRules.m
//  Roulette
//
//  Created by Sergio Botero on 8/9/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "CasinoRules.h"


@implementation CasinoRules

+ (int) getColorForNumber:(int)number{
	int color = kNoColor;
	
	if( (number >= 29 && number < 37) || (number >= 11 && number < 19) ){
		color = (number % 2 == 0)? kRedColor : kBlackColor;
	
	}else if (number >= 19 && number < 29 || (number >= 1 && number < 11) ) {
		color = (number % 2 == 0)? kBlackColor : kRedColor;
	
	}
	
	return color;
}

@end
