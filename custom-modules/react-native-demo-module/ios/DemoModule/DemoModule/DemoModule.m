#import "DemoModule.h"
#import "react_native_demo_module-Swift.h"

@implementation DemoModule {
    GroupActivityHandler* groupActivityHandler;
}

- (id) init {
    groupActivityHandler = [[GroupActivityHandler alloc] init];
    return [super init];
}

RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(getElegibleForGroupSession, resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
{
    @try {
        
        [groupActivityHandler subscriberEligibleForGroupSession:^(BOOL isElegibleForGroupSession) {
            resolve([NSNumber numberWithBool:isElegibleForGroupSession]);
        }];
    } @catch (NSException *exception) {
        NSString *error = @"Can not get the current location";
        reject(@"Error", @"Error description", error);
    }
}

@end

