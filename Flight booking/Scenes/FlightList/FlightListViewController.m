//
//  FlightListViewController.m
//  Flight booking
//
//  Created by Dmitrii Shliugaev on 28/07/2022.
//

#import "FlightListViewController.h"
#import "FlightTableViewCell.h"
#import "FlightStore.h"
#import "BookingViewController.h"

@interface FlightListViewController ()

@end

@implementation FlightListViewController

NSString *flightTableViewCellID = @"FlightTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    [self setupNavBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
    
    if ([[[FlightStore sharedInstance] getFlights] count] == 0) {
        [self doBooking:nil];
    }
}

- (void)setupTableView {
    [self.tableView registerNib:[UINib nibWithNibName:flightTableViewCellID bundle:nil] forCellReuseIdentifier:flightTableViewCellID];
}

- (void)setupNavBar {
    UIBarButtonItem *bookingButton = [[UIBarButtonItem alloc] initWithTitle:@"Booking" style:UIBarButtonItemStyleDone target:self action:@selector(doBooking:)];
    self.navigationItem.rightBarButtonItem = bookingButton;
}

//MARK: - Router

- (void)doBooking:(id)sender {
    BookingViewController *controller = [[BookingViewController alloc] initWithNibName:@"BookingViewController" bundle:nil];
    [self.navigationController pushViewController:controller animated:TRUE];
}

//MARK: - UITableViewDelegate, UITableViewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    FlightTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:flightTableViewCellID];
    [cell setup:[[FlightStore sharedInstance] getFlightsByRow:indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[FlightStore sharedInstance] getFlights] count];
}

@end
