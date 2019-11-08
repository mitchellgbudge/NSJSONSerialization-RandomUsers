//
//  MBPeopleTableViewController.h
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBPersonController.h"

@interface MBPeopleTableViewController : UITableViewController

@property (nonatomic) MBPersonController *personController;

@end

