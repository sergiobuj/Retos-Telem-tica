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
	int playerIndex = 0, tableIndex = 0, currentPlayer = 0, playerCount = 0, tableCount = 0;
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
					if (tableCount <= 0) {
						printf("No hay mesas\n");
					}else {
						for( Table *table in tables )
							if (table != nil) printf("%s\n", [[table description] UTF8String]);
					}
					
				}else if ( [currentWord compare:@"crear"] == 0 ) {
					tableIndex += 1;
					tableCount += 1;
					Table *newTable = [[Table alloc] initWithID:[NSNumber numberWithInt:tableIndex]];
					[tables addObject:newTable];
					printf("Creada mesa: %d\n", tableIndex);
					[newTable release];
					
				}else if ( [currentWord compare:@"eliminar"] == 0 ) {
					[scanner scanUpToString:@" " intoString:&currentWord];
					
					if ([currentWord intValue] <= tableIndex && [currentWord intValue] > 0) {
						
						for(Player *player in [[tables objectAtIndex:[currentWord intValue] -1] gamblers ])
							[player setCurrentTable:nil];
						
						[tables replaceObjectAtIndex:[currentWord intValue] -1 withObject:nil];
						tableCount -= 1;
						
						printf("Mesa eliminada\n");
					}else {
						printf("No existe esa mesa\n");
					}
					
					
				}else {
					// no se entiende
					printf("No se Reconoce la opcion\n1\tcrear\n2\tlista\n3\teliminar\n");
					
				}
				
				
				
				
				
			}else if ( [ currentWord compare:@"jugador"] == 0 ) {
				
				[scanner scanUpToString:@" " intoString:&currentWord];
				
				
				
				if( [currentWord compare:@"crear"] == 0 ){
					[scanner scanUpToString:@" " intoString:&currentWord];
					if (currentWord && [currentWord compare:@"crear"] != 0 ) {
						playerIndex += 1;
						playerCount += 1;
						currentPlayer = playerIndex;
						Player *newPlayer = [[Player alloc] initWithID:playerIndex Name:currentWord money:1000.0];
						[players addObject:newPlayer];
						printf("%s entró al casino\n", [currentWord UTF8String]);
						[newPlayer release];
						
					}else {
						printf("Se necesita nombre de Jugador\n");
					}
					
					
					
					
					
				}else if ( [currentWord compare:@"apuesta"] == 0 ) {
					[scanner scanUpToString:@" " intoString:&currentWord];
					double betValue = [currentWord doubleValue];
					[scanner scanUpToString:@" " intoString:&currentWord];
					int betOption = [currentWord intValue]; 
					if ( currentWord != nil ) {
						
						if ( [[players objectAtIndex:currentPlayer -1] currentTable] != nil ) {
							
							if (betOption >=0 && betOption <= 41) {
								if (betValue <= [[[players objectAtIndex:currentPlayer -1] money] doubleValue]) {
									[[players objectAtIndex:currentPlayer -1] placeBetOfValue:betValue forOption:betOption];
								}
							}
							
						}else {
							printf("El jugador debe tener mesa\n");
						}
						
						
					}else {
						printf("jugador\tapuesta\tvalor\topcion\nplano:\t0..37 (00 -> 37)\ncolor:\trojo -> 38\n\tnegro -> 39\nimpar:\t40\npar:\t41\n");
					}
					
					
					
					
				}else if ( [currentWord compare:@"lista"] == 0 ) {
					if (playerCount <= 0) {
						printf("No hay jugadores\n");
					}else {
						for( Player *player in players )
							if (player != nil) printf("%s\n", [[player description] UTF8String]);
					}
					
					
					
					
					
				}else if ( [currentWord compare:@"sale"] == 0 ) {
					[players replaceObjectAtIndex:(currentPlayer-1) withObject:nil];
					playerCount -= 1;
					if (playerCount > 0) {
						for(Player * firstNoNil in players)
							if (firstNoNil != nil) {
								currentPlayer = [players indexOfObject:firstNoNil] + 1;
								break;
							}
					}
					printf("El jugador salio del casino\n");
					
					
					
					
					
				}else if ( [currentWord intValue] > 0 && [currentWord intValue] <= playerIndex ) {
					if ( [players objectAtIndex:[currentWord intValue] -1 ] != nil ) {
						currentPlayer = [currentWord intValue];
						printf("Jugador: %s\n", [[[players objectAtIndex:[currentWord intValue] -1 ] name] UTF8String] );
					}
					
					
				}else if ( [currentWord compare:@"mesa"] == 0 ) {
					[scanner scanUpToString:@" " intoString:&currentWord];
					if ( [currentWord compare:@"mesa"] != 0 && tableCount > 0) {
						[[players objectAtIndex:currentPlayer-1] setCurrentTable:[tables objectAtIndex:[currentWord intValue]-1 ]];
					}else {
						printf("Se necesita el número de mesa válido\n");
					}

					
				}else {
					printf("No se Reconoce la opcion\n1\tcrear\n2\tapuesta\n3\tID\t(para cambiar de jugador)\n");
				}
				
				
				
				
				
				
				
			}else if ( [currentWord compare:@"salir"] == 0 ) {
				closeCasino = TRUE;
			}else if ( [currentWord compare:@"ruleta"] == 0 ) {
				[scanner scanUpToString:@" " intoString:&currentWord];
				if ( [currentWord intValue] <= tableIndex && [currentWord intValue] > 0 ) {
					Table * auxTable = [tables objectAtIndex: [currentWord intValue] -1 ]; 
					if ( auxTable != nil && [[auxTable bets] count] > 0) {
						[[tables objectAtIndex: [currentWord intValue] -1 ] spinTheWheel];
						
						for(Player *player in [[tables objectAtIndex:[currentWord intValue] -1] gamblers])
							printf("%s\n",[[player spinResult] UTF8String]);
						
					}else {
						printf("No hay apuestas en la mesa\n");
					}
					
				}
				
			}else {
				// no se entiende
				printf("No se Reconoce la opcion\n1\tmesa\n2\tjugador\n3\truleta\n4\tsalir\n");
			}
			
		}
		
		[newPool drain];
	}
	
	
}

@end
