//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Ryan Cohen on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

- (instancetype)init {
    self = [super init];
    
    if (self) {
        self = [self initWithName:@"" latitude:0.0 longitude:0.0];
    }
    
    return self;
}

- (instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [NSMutableArray new];
    }
    
    return self;
}

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if (length > self.name.length) {
        return self.name;
    }
    
    return [self.name substringToIndex:length];
}

- (BOOL)hasValidData {
    BOOL isValid = YES;
    
    if ([self.name isEqualToString:@""] || self.name == nil) {
        isValid = NO;
    } else if (self.latitude < -90.0 || self.latitude > 90.0) {
        isValid = NO;
    } else if (self.longitude == -180.0 || self.longitude < -180.0 || self.longitude > 180.0) {
        isValid = NO;
    }
    
    return isValid;
}

- (FISTrivium *)triviumWithMostLikes {
    if (self.trivia == nil) {
        return nil;
    }
    
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    [self.trivia sortUsingDescriptors:@[sortDesc]];
    
    return [self.trivia firstObject];
}

@end
