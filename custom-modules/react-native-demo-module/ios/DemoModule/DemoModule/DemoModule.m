#import "DemoModule.h"
#import "react_native_demo_module-Swift.h"

@implementation DemoModule {
    GroupActivityHandler* groupActivityHandler;
}

RCT_EXPORT_MODULE()

- (id) init {
    groupActivityHandler = [[GroupActivityHandler alloc] init];
    return [super init];
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"onEligibilityChange"];
}

RCT_EXPORT_METHOD(subscriberEligibleForGroupSession) {
    [groupActivityHandler subscriberEligibleForGroupSession:^(BOOL isElegibleForGroupSession) {
        [self sendEventWithName:@"onEligibilityChange" body:[NSNumber numberWithBool:isElegibleForGroupSession]];
    }];
}

@end



