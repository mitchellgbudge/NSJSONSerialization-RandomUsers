//
//  MBPersonController.m
//  RandomUsers-Objective-C
//
//  Created by Mitchell Budge on 11/7/19.
//  Copyright © 2019 Mitchell Budge. All rights reserved.
//

#import "MBPersonController.h"
#import "MBPerson.h"

@interface MBPersonController ()

@property NSMutableArray *internalPeople;

@end

@implementation MBPersonController

static NSString *const baseURLString = @"https://randomuser.me/api/?format=json&results=20";

- (NSArray *)people {
    return self.internalPeople;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _internalPeople = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)searchForPeople:(void (^)(NSError *error))completion {
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSURLSessionDataTask *dataTask = [NSURLSession.sharedSession dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            completion(error);
            return;
        }
        
        NSError *jsonError = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        if (jsonError) {
            completion(nil);
            return;
        }
        
        if (![json isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary as expected");
            completion([[NSError alloc] init]);
        }
        
        NSArray *fetchedData = json[@"results"];
        NSMutableArray *fetchedPeople = [[NSMutableArray alloc] init];
        
        for (NSDictionary *personDictionary in fetchedData) {
            MBPerson *person = [[MBPerson alloc] initWithDictionary:personDictionary];
            [fetchedPeople addObject:person];
        }
        self.internalPeople = fetchedPeople;
        completion(nil);
    }];
    [dataTask resume];
}

@end
