//
//  FlightStore.m
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import "FlightStore.h"

@interface FlightStore ()
{
    NSMutableArray *flights;
}
@end

@implementation FlightStore

- (instancetype)init
{
    self = [super init];
    if (self) {
        self->flights = [NSMutableArray new];
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static FlightStore *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[FlightStore alloc] init];
    });
    return sharedInstance;
}

- (NSArray *) getFlights {
    return flights;
}

- (FlightModel *) getFlightsByRow:(NSInteger) row {
    return flights[row];
}

- (void)addNewFlight:(FlightModel *)flightModel {
    [flights addObject:flightModel];
}

@end
