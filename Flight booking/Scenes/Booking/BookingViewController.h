//
//  BookingViewController.h
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookingViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *flightTypeSegmentControll;
@property (weak, nonatomic) IBOutlet UITextField *departureCityTextField;
@property (weak, nonatomic) IBOutlet UITextField *arrivingCityTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *departureDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *passengersCountTextField;
@property (weak, nonatomic) IBOutlet UITextField *flightClassTextField;

@end

NS_ASSUME_NONNULL_END
