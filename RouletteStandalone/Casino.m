//
//  Casino.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import <stdio.h>
#import "Casino.h"
#import "Table.h"
#import "Player.h"

#define getNextCurrentWord [scanner scanUpToString:@" " intoString:&currentWord]

@implementation Casino

// The Casino opens for some Roulette...
+ (void) onBusiness{
	srandom(time(NULL));
	
	
	BOOL closeCasino = FALSE;
	
	NSMutableDictionary *tables = [[NSMutableDictionary alloc] init];
	NSMutableDictionary *players = [[NSMutableDictionary alloc] init];
	
	int playerIndex = 0, currentPlayer = 0, playerCount = 0; 
	int tableIndex = 0, tableCount = 0;
	
	NSAutoreleasePool * newPool;	
	while ( !closeCasino ) {
		newPool = [[NSAutoreleasePool alloc] init];
		
		char inputString[1024]= {0};
		fgets(inputString, sizeof inputString, stdin);
		
		NSString *inputStringNS = [[NSString alloc] initWithCString:inputString];
		inputStringNS = [inputStringNS stringByReplacingCharactersInRange:NSMakeRange( [inputStringNS length] -1 , 1) withString:@" "];
		
		NSScanner *scanner = [NSScanner scannerWithString:inputStringNS];
		NSString * currentWord;

		while ([scanner isAtEnd] == NO) {
			getNextCurrentWord;
			
			
			/* Mesa */
			if ( [currentWord compare:@"mesa"] == 0 ) {
				getNextCurrentWord;
				
				if( [currentWord compare:@"lista"] == 0 ){

					NSArray *temp = [tables allValues];
					for(Table *key in temp)
						printf("%s\n", [[key description] UTF8String] );
//						NSLog(@"%@",key);
					
				}else if ( [currentWord compare:@"crear"] == 0 ) {
					tableIndex += 1;
					tableCount += 1;
					Table *newTable = [[Table alloc] initWithID:tableIndex];
					[tables setObject:newTable forKey: [NSString stringWithFormat:@"%d",tableIndex] ];
					[newTable release];

				}else if ( [currentWord compare:@"eliminar"] == 0 ) {
					getNextCurrentWord;
					
				}else {
					
				}
				

			
			/* Jugador */
			}else if ( [ currentWord compare:@"jugador"] == 0 ) {
				getNextCurrentWord;
				
				if( [currentWord compare:@"crear"] == 0 ){
					getNextCurrentWord;
					playerIndex += 1;
					currentPlayer = playerIndex;
					playerCount += 1;
					Player *newP = [[Player alloc] initWithID:playerIndex Name:currentWord money:1000.0];
					[players setObject:newP forKey:[NSString stringWithFormat:@"%d",playerIndex]];
					[newP release];
				}else if ( [currentWord compare:@"apuesta"] == 0 ) {
//					NSLog(@"jugador %d quiere apostar", currentPlayer);
					getNextCurrentWord;
					double value = [currentWord doubleValue];
//					NSLog(@"value %d",value);
					if(value <= [[players objectForKey:[NSString stringWithFormat:@"%d",currentPlayer]] money]){
						[[players objectForKey:[NSString stringWithFormat:@"%d",currentPlayer]] collect:-value];
						getNextCurrentWord;
						int option = [currentWord intValue];
//						NSLog(@"option %d", option);
						if (option >= 0 && option <= 41) {
							int playerTable = [[players objectForKey:[NSString stringWithFormat:@"%d",currentPlayer]] tableID];
							
							[[tables objectForKey:[NSString stringWithFormat:@"%d",playerTable]] receiveBetFromGambler:currentPlayer forValue:value toOption:option];
						}else {
							printf("opción inválida\n");
						}


					}
				}else if ( [currentWord compare:@"lista"] == 0 ) {
					NSArray *temp = [players allValues];
					for(Player *key in temp){
						printf("%s\n",[[key description] UTF8String]);
					}
				}else if ( [currentWord compare:@"sale"] == 0 ) {
								
				}else if ( [players objectForKey: [NSString stringWithFormat:@"%d",[currentWord intValue]] ] != nil ) {
					currentPlayer = [currentWord intValue];
				}else if ( [currentWord compare:@"mesa"] == 0 ) {
					getNextCurrentWord;
					if ( [tables objectForKey: [NSString stringWithFormat:@"%d",tableIndex] ] != nil ) {
						if ([ players objectForKey:[NSString stringWithFormat:@"%d", currentPlayer]] != nil) {
							[[ players objectForKey:[NSString stringWithFormat:@"%d", currentPlayer]] setTableID:[currentWord intValue]];
						}
					}
				}else {
				
				}
				
				
				
				
				
				
				/* Correr una ruleta */
			}else if ( [currentWord compare:@"ruleta"] == 0 ) {
				getNextCurrentWord;
				NSString * index = [ NSString stringWithFormat:@"%d",[currentWord intValue]];
				if ( tableCount > 0 && [tables objectForKey:index] != nil ) {
					[[tables objectForKey:index] spinTheWheel];
					
					NSDictionary * payouts = [[tables objectForKey:index] payouts];

					for(NSString *key in payouts){
						//int person = [key intValue];

						double pay = [[payouts valueForKey:key] doubleValue];
						printf("Pago de:\t%lf\n", pay);
						[[players objectForKey:key] collect:pay];
					}
				}
				
				
				/* Manejo juego*/
			}else if ( [currentWord compare:@"salir"] == 0 ) {
				closeCasino = TRUE;
				
				/* No se entiende */
			}else {
				
			}
			
		}
		
		[newPool drain];
	}
	
	
}

@end
