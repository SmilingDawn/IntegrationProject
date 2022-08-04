//
//  NativeScreenMoveManager.m
//  IntegrationProject
//
//  Created by jongmin.lee on 2022/08/04.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(NativeCounterManager, NSObject)

RCT_EXTERN_METHOD(sendValue:(NSString *)value)
RCT_EXTERN_METHOD(sendValueInt:(NSInteger*)value)
RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)date)

RCT_EXTERN_METHOD(increment:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(decrement:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)


@end
