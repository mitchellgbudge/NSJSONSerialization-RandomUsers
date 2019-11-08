//
//  MBPeopleTableViewController.m
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBPeopleTableViewController.h"
#import "MBPerson.h"
#import "MBPersonDetailViewController.h"

@interface MBPeopleTableViewController ()

@end

@implementation MBPeopleTableViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _personController = [[MBPersonController alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.personController searchForPeople:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.personController.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PersonCell" forIndexPath:indexPath];
    MBPerson *person = self.personController.people[indexPath.row];
    cell.textLabel.text = person.name;
    NSURL *url = [NSURL URLWithString:person.thumbnail];
    NSData *data = [NSData dataWithContentsOfURL:url];
    cell.imageView.image = [UIImage imageWithData:data];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowPersonSegue"]) {
        MBPersonDetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        destinationVC.person = self.personController.people[indexPath.row];
    }
}

@end
