//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    FISBlackjackPlayer *player = [[FISBlackjackPlayer alloc] initWithName:@"Sergey"];
    NSLog(@"%@", player.description);
    
    FISCardDeck *deck = [FISCardDeck new];
    FISCard *card = [FISCard new];
    
    [deck drawNextCard];
    [player acceptCard:card];
    
    return YES;
}

@end
