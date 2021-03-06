//
//  BCEEDetailViewController.m
//  ConferenceApp
//
//  Created by Tim Cheung on 10/26/2013.
//  Copyright (c) 2013 Tim Cheung Napon Taratan Arianne Dee.
//  All rights reserved.

#import "BCEEDetailViewController.h"
#import "BCEESession.h"
#import "BCEETimeSlot.h"
#import "BCEESplashViewController.h"
#import "BCEESurveyViewController.h"

@interface BCEEDetailViewController ()


@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation BCEEDetailViewController



#pragma mark - Managing the detail item

- (void)setDetailItem:(BCEESession *)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}

- (void)configureView
{
    // Set up date formatter
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    
    // Retrieve the date and time of the session
    [df setDateFormat:@"EEEE"];
    NSString *date = [df stringFromDate:[self.detailItem startTime]];
    [df setDateFormat:@"HH:mm"];
    NSString *startTime = [df stringFromDate:[self.detailItem startTime]];
    [df setDateFormat:@"HH:mm"];
    NSString *endTime = [df stringFromDate:[self.detailItem endTime]];
    
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
        self.lbl_sessionName.text = [self.detailItem name];
        self.lbl_date.text = [NSString stringWithFormat:@"%@, %@~%@", date, startTime, endTime];
        self.description.text = [self.detailItem description];
        self.lbl_location.text = [self.detailItem location];
        self.lbl_speakerNames.text = [self.detailItem speakers];
        self.biography.text = [self.detailItem biography];
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
   // self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.68 blue:0.1 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

#pragma mark - IBActions

- (IBAction)onSurveyButtonClicked:(id)sender {
     urltosend = [_detailItem surveyLink];
}
@end
