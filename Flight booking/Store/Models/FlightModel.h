//
//  FlightModel.h
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum FlightType{
    OneWay,
    RoundTrip,
    FlightTypeCount
} FlightType;

typedef enum FlightClass{
    Economy,
    PremiumEconomy,
    Business,
    FirstClass,
    FlightClassCount
} FlightClass;

@interface FlightModel : NSObject

@property (strong, nonatomic) NSString *departureCity;
@property (strong, nonatomic) NSString *arrivingCity;
@property (strong, nonatomic) NSDate *departureDate;
@property (assign, nonatomic) int passengersCount;
@property (assign, nonatomic) FlightType flightType;
@property (assign, nonatomic) FlightClass flightClass;

+ (NSString*)flightTypeToString:(FlightType)flightType;
+ (NSString*)flightClassToString:(FlightClass)flightClass;

@end


NS_ASSUME_NONNULL_END
