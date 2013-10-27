//
//  BCEESplashViewController.h
//  ConferenceApp
//
//  Created by sNapZ on 10/26/2013.
//  Copyright (c) 2013 Arianne Dee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCEETimeSlot.h"
#import "BCEEMasterViewController.h"
#import "BCEEMasterViewController.h"

//NSMutableArray *sessionArray;
//extern NSString* const SESSION_INFO_URL;
//extern NSString* const DATE_FORMAT;

@interface BCEESplashViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *img_splash;
@property (strong, nonatomic) IBOutlet UIButton *btn_start;
@property (strong, nonatomic) IBOutlet UIButton *btn_endSurvey;

- (void)onBCEEScheduleRecieved:(NSMutableArray *)receievedSchedule;

@end
