//
//  CasinoRules.m
//  Roulette
//
//  Created by Sergio Botero on 8/9/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "CasinoRules.h"


@implementation CasinoRules

+ (NSArray *) arrayOfColors{
		NSArray *colorOfNumber = [[NSArray alloc] initWithObjects:
						 kRedColor, //1
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor, //10
						 
						 kBlackColor, //11
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor, //18
						 
						 kRedColor, //19
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor, //28
						 
						 kBlackColor, //29
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor,
						 kBlackColor,
						 kRedColor, //36
						 nil ];
	return [colorOfNumber autorelease];
}

@end
