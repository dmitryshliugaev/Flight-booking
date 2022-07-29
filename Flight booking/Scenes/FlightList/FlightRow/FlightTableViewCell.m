//
//  FlightTableViewCell.m
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import "FlightTableViewCell.h"

@implementation FlightTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setup:(FlightModel *)model {
    self.departureСityLabel.text = [NSString stringWithFormat:@"Departure city: %@", model.departureCity];
    self.arrivingCityLabel.text = [NSString stringWithFormat:@"Arriving city: %@", model.arrivingCity];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm";
    self.departureDateLabel.text = [NSString stringWithFormat:@"Departure date: %@", [formatter stringFromDate:model.departureDate]];
    self.passengersCountLabel.text = [NSString stringWithFormat:@"Passengers count: %d", model.passengersCount];
    self.flightTypeLabel.text = [FlightModel flightTypeToString: model.flightType];
}

@end
