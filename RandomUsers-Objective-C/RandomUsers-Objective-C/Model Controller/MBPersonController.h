//
//  MBPersonController.h
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBPersonController : NSObject

@property (nonatomic) NSArray *people;

- (void)searchForPeople:(void (^)(NSError *error))completion;

@end

