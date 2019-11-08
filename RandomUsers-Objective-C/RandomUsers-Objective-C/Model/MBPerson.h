//
//  MBPerson.h
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBPerson : NSObject

@property NSString *name;
@property NSString *phone;
@property NSString *email;
@property NSString *thumbnail;
@property NSString *profile;

- (instancetype) initWithName:(NSString *)name phone:(NSString *)phone email:(NSString *)email thumbnail:(NSString *)thumbnail profile:(NSString *)profile;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;


@end


