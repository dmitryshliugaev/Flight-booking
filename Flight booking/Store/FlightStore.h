//
//  FlightStore.h
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import <Foundation/Foundation.h>
#import "FlightModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlightStore : NSObject

+ (instancetype)sharedInstance;

- (NSArray *) getFlights;
- (FlightModel *) getFlightsByRow:(NSInteger) row;
- (void)addNewFlight:(FlightModel *)flightModel;

@end

NS_ASSUME_NONNULL_END
