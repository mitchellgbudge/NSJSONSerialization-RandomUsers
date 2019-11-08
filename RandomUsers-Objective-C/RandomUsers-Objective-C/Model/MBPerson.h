//
//  MBPerson.h
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBPerson : NSObject

@property NSString *email;

- (instancetype) initWithEmail:(NSString *)email;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;

@end


