//
//  GlobalMethods.m
//  Pony Tales
//
//  Created by Grigo Mathews on 16/07/14.
//  Copyright (c) 2014 Paulose Ink. All rights reserved.
//

#import "GlobalMethods.h"
#import "Reachability.h"

@implementation GlobalMethods

#pragma mark - Internet Status
- (BOOL) connected
{

    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return !(networkStatus == NotReachable);
}
#pragma mark - Encoding String
- (NSString*)stringTrimming:(NSString *)string
{
    NSString *newString = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge  CFStringRef)string, NULL, CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`"), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    if (newString){
        return newString;
    }
    return @"";
}
#pragma mark-\n adding
- (NSString  *)trimmingFunctionforNewLine:(NSString *)str{
    
    NSString *blankItem = str;
    blankItem = [blankItem stringByReplacingOccurrencesOfString:@"#" withString:@"\n"];
    // NSLog(@"%@",blankItem);
    return blankItem;
}
//for (int i=0; i<self.beaconsArray.count; i++) {
//    
//    self.beacon=[self.beaconsArray objectAtIndex:i];
//    self.beaconManager = [[ESTBeaconManager alloc] init];
//    self.beaconManager.delegate = self;
//    
//    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:self.beacon.proximityUUID
//                                                                major:[self.beacon.major unsignedIntValue]
//                                                                minor:[self.beacon.minor unsignedIntValue]
//                                                           identifier:@"RegionIdentifier"];
//    
//    self.beaconRegion.notifyOnEntry = YES;
//    self.beaconRegion.notifyOnExit = YES;
//    
//    [self.beaconManager startMonitoringForRegion:self.beaconRegion];
//}

@end
