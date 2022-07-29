//
//  FlightTableViewCell.h
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import <UIKit/UIKit.h>
#import "FlightModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FlightTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *departureСityLabel;
@property (weak, nonatomic) IBOutlet UILabel *arrivingCityLabel;
@property (weak, nonatomic) IBOutlet UILabel *departureDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *passengersCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *flightTypeLabel;

-(void)setup:(FlightModel*) model;
@end

NS_ASSUME_NONNULL_END
