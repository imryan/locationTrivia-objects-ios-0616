//  FISAppDelegate.h

#import <UIKit/UIKit.h>
#import "FISLocation.h"

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) NSMutableArray *locations;

- (NSArray *)allLocationNames;
- (NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin;
- (FISLocation *)locationNamed:(NSString *)name;

@end
