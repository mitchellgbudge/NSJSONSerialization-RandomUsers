//
//  MBPerson.m
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBPerson.h"

@implementation MBPerson

- (instancetype) initWithName:(NSString *)name phone:(NSString *)phone email:(NSString *)email thumbnail:(NSString *)thumbnail profile:(NSString *)profile {
    if (self = [super init]) {
        _name = name;
        _phone = phone;
        _email = email;
        _thumbnail = thumbnail;
        _profile = profile;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSDictionary *nameDictionary = dictionary[@"name"];
    NSString *firstName = nameDictionary[@"first"];
    NSString *lastName = nameDictionary[@"last"];
    NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    
    NSString *phone = dictionary[@"phone"];
    
    NSString *email = dictionary[@"email"];
    
    NSDictionary *imageDictionary = dictionary[@"picture"];
    NSString *thumbnail = imageDictionary[@"thumbnail"];
    NSString *profile = imageDictionary[@"large"];
    
    return [self initWithName:name phone:phone email:email thumbnail:thumbnail profile:profile];
}
        
@end
