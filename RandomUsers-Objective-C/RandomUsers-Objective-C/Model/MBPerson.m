//
//  MBPerson.m
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBPerson.h"

@implementation MBPerson

- (instancetype) initWithEmail:(NSString *)email {
    if (self = [super init]) {
        _email = email;
    }
    return self;
}

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    NSString *email = dictionary[@"email"];
    
    return [self initWithEmail:email];
}
        
@end
