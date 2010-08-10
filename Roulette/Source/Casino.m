//
//  Casino.m
//  Roulette
//
//  Created by Sergio Botero on 8/8/10.
//  Copyright 2010 Sergiobuj. All rights reserved.
//

#import "Casino.h"
#import "Table.h"
#import <stdio.h>
#import "Player.h"
@implementation Casino

// The Casino opens for some Roulette...
+ (void) onBusiness{
	

	BOOL closeCasino = FALSE;
	
	NSMutableArray *tables = [[NSMutableArray alloc] init];
	NSMutableArray *players = [[NSMutableArray alloc] init];
	int playerIndex = 0, tableIndex = 0;
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
			[scanner scanUpToString:@" " intoString:&currentWord];

			if ( [currentWord compare:@"mesa"] == 0 ) {
				[scanner scanUpToString:@" " intoString:&currentWord];
			
				if( [currentWord compare:@"lista"] == 0 ){
					if (tableIndex == 0) {
						printf("No hay mesas\n");
					}else {
						for( Table *table in tables )
							printf("%s\n", [[table description] UTF8String]);
					}
				
				}else if ( [currentWord compare:@"crear"] == 0 ) {
					tableIndex += 1;
					Table *newTable = [[Table alloc] initWithID:[NSNumber numberWithInt:tableIndex]];
					[tables addObject:newTable];
					printf("Creada mesa: %d\n", tableIndex);
					[newTable release];

				}else if ( [currentWord compare:@"eliminar"] == 0 ) {
					[scanner scanUpToString:@" " intoString:&currentWord];
					
					if ([currentWord intValue] <= tableIndex && [currentWord intValue] > 0) {

						for(Player *player in [[tables objectAtIndex:[currentWord intValue] -1] gamblers ])
							[player setCurrentTable:nil];
						
						[tables removeObjectAtIndex:[currentWord intValue] -1 ];
						printf("Mesa eliminada\n");
					}else {
						printf("No existe esa mesa\n");
					}

				
				}else {
					// no se entiende
					printf("No se Reconoce la palabra\n1\tcrear\n2\tlista\n3\teliminar\n");

				}

				
			}else if ( [ currentWord compare:@"jugador"] == 0 ) {

				[scanner scanUpToString:@" " intoString:&currentWord];
				if( [currentWord compare:@"crear"] == 0 ){
					
				}else if ( [currentWord compare:@"apuesta"] == 0 ) {
					
				}else if ( [currentWord compare:@""] == 0 ) {
					
				}else {
					
				}

			}else if ( [currentWord compare:@"salir"] == 0 ) {
				closeCasino = TRUE;
			}else if ( [currentWord compare:@"ruleta"] == 0 ) {
				[scanner scanUpToString:@" " intoString:&currentWord];
				if ( [currentWord intValue] <= tableIndex && [currentWord intValue] > 0 ) {
					Table * auxTable = [tables objectAtIndex: [currentWord intValue] -1 ]; 
					if ( [[auxTable bets] count] > 0) {
						[[tables objectAtIndex: [currentWord intValue]] spinTheWheel];
					}else {
						printf("No hay apuestas en la mesa\n");
					}

				}
				
			}else {
				// no se entiende
				printf("No se Reconoce la palabra\n1\tmesa\n2\tjugador\n3\truleta\n4\tsalir\n");
			}

		}

		[newPool drain];
	}
	
	
}

@end
