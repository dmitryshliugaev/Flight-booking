//
//  FlightModel.m
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import "FlightModel.h"

@implementation FlightModel

+ (NSString*)flightTypeToString:(FlightType)flightType {
    NSString *result = nil;
    
    switch(flightType) {
        case OneWay:
            result = @"⬆️ one-way";
            break;
        case RoundTrip:
            result = @"🔁 round trip";
            break;
            
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}

+ (NSString*)flightClassToString:(FlightClass)flightClass {
    NSString *result = nil;
    
    switch(flightClass) {
        case Economy:
            result = @"economy";
            break;
        case PremiumEconomy:
            result = @"premium economy";
            break;
        case Business:
            result = @"business";
            break;
        case FirstClass:
            result = @"first class";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected FormatType."];
    }
    
    return result;
}

@end
