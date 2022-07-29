//
//  BookingViewController.m
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import "BookingViewController.h"
#import "FlightModel.h"
#import "FlightStore.h"

@interface BookingViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
{
    FlightModel *newFlightModel;
}

@property (strong, nonatomic) UIPickerView *flightClassPickerView;
@property (strong, nonatomic) NSArray *flightClasses;

@end

@implementation BookingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    newFlightModel = [[FlightModel alloc] init];
    newFlightModel.departureDate = [NSDate new];
    
    [self setupPickers];
    [self setupNavBar];
}

- (void)setupNavBar {
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStyleDone target:self action:@selector(create:)];
    self.navigationItem.rightBarButtonItem = createButton;
}

- (void)setupPickers {
    [self.departureDatePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
    self.departureDatePicker.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    
    self.flightClassPickerView = [[UIPickerView alloc] init];
    self.flightClassPickerView.delegate = self;
    self.flightClassPickerView.dataSource = self;
    
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    [toolbar setTranslucent:TRUE];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(handleDoneButton:)];
    [toolbar setItems:@[doneButton]];
    [toolbar setUserInteractionEnabled:TRUE];
    self.flightClassTextField.inputAccessoryView = toolbar;
    [toolbar sizeToFit];
    self.flightClassTextField.inputView = self.flightClassPickerView;
    self.flightClassTextField.text = [FlightModel flightClassToString:Economy];
}

- (void)create:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"Ok"
                                                     style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    
    if (self.departureCityTextField.text.length < 1) {
        alert.message = @"Departure city field not filled!";
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    if (self.arrivingCityTextField.text.length < 1) {
        alert.message = @"Arriving city field not filled!";
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    if (self.passengersCountTextField.text.length < 1) {
        alert.message = @"Passengers count field not filled!";
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    int passengersCount = [self.passengersCountTextField.text intValue];
    
    if (passengersCount == 0) {
        alert.message = @"Passengers count field must fill in numbers!";
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    
    newFlightModel.departureCity = self.departureCityTextField.text;
    newFlightModel.arrivingCity = self.arrivingCityTextField.text;
    newFlightModel.passengersCount = passengersCount;
    newFlightModel.flightType = self.flightTypeSegmentControll.selectedSegmentIndex == 0 ? OneWay : RoundTrip;
    
    [[FlightStore sharedInstance] addNewFlight:newFlightModel];
    [self back];
}

//MARK: - Router
- (void)back {
    [self.navigationController popViewControllerAnimated:true];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    if (pickerView == self.flightClassPickerView) {
        return 1;
    }
    
    return 0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.flightClassPickerView) {
        return FlightClassCount;
    }
    
    return 0;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.flightClassPickerView) {
        return [FlightModel flightClassToString:(FlightClass) row];
    }
    
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.flightClassPickerView) {
        self.flightClassTextField.text = [FlightModel flightClassToString:(FlightClass) row];
        newFlightModel.flightClass = (FlightClass) row;
    }
}

#pragma mark - UIDatePickerDelegate

- (void)onDatePickerValueChanged:(UIDatePicker *)datePicker {
    newFlightModel.departureDate = datePicker.date;
}

- (void) handleDoneButton:(UIButton *) sender {
    [self.flightClassTextField resignFirstResponder];
}

@end
