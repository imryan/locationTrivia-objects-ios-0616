//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)allLocationNames {
    NSMutableArray *locationNames = [NSMutableArray array];
    
    if (self.locations.count > 0) {
        for (FISLocation *location in self.locations) {
            [locationNames addObject:location.name];
        }
    }
    
    return locationNames;
}

- (NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    NSMutableArray *locationsArray = [NSMutableArray array];

    for (FISLocation *location in self.locations) {
        if (margin == 0.0 && location.latitude == latitude && location.longitude == longitude) {
            return @[location];
        }
        
        if ((location.latitude + margin <= latitude || location.latitude - margin <= latitude) &&
            (location.longitude + margin <= latitude || location.longitude - margin <= longitude)) {

            [locationsArray addObject:location];
        }
    }
    
    return locationsArray;
}

- (FISLocation *)locationNamed:(NSString *)name {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name MATCHES %@", name];
    return [[self.locations filteredArrayUsingPredicate:predicate] firstObject];
}

@end
