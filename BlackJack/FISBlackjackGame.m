//
//  FISBlackjackGame.m
//  BlackJack
//
//  Created by Sergey Nevzorov on 6/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackGame.h"

@implementation FISBlackjackGame

- (instancetype)init {
    
    self = [super init];

    if (self) {
        _house = [[FISBlackjackPlayer alloc]initWithName:@"House"];
        _player = [[FISBlackjackPlayer alloc]initWithName:@"Player"];
        _deck = [[FISCardDeck alloc]init];
    }
    return self;
}

- (void)playBlackJack {
    
//    [self.deck resetDeck];
//    [self dealNewRound];
 
    
}

- (void)dealNewRound {
    
    [self dealCardToPlayer];
    [self dealCardToHouse];
    [self dealCardToPlayer];
    [self dealCardToHouse];
}

- (void)dealCardToPlayer {
    
    FISCard *cardToPlayer = [self.deck drawNextCard];
    [self.player acceptCard:cardToPlayer];
    
}

- (void)dealCardToHouse {
    
    FISCard *cardToHouse = [self.deck drawNextCard];
    [self.house acceptCard:cardToHouse];
    
}

- (void)processPlayerTurn {
    
    if (self.player.busted == NO && self.player.stayed == NO &&
self.player.blackjack == NO && [self.player shouldHit]) {
        [self dealCardToPlayer];
    }
}
- (void)processHouseTurn {
    
    if (self.house.busted == NO && self.house.stayed == NO &&
        self.house.blackjack == NO && [self.house shouldHit]) {
        [self dealCardToHouse];
    }
}

- (BOOL)houseWins {
    
    if (self.house.blackjack == YES && self.player.blackjack == YES) {
        return NO;
    }
    
    if (self.player.handscore > self.house.handscore) {
        return NO;
    }
        if (self.house.busted == YES) {
            return NO;
        
    }
    
    return YES;
}

- (void)incrementWinsAndLossesForHouseWins:(BOOL)houseWins {
    
    if (houseWins == YES) {
        self.house.wins++;
        self.player.losses++;
    }
    
    if (houseWins == NO) {
        self.house.losses++;
        self.player.wins++;
    }
    
}




@end
