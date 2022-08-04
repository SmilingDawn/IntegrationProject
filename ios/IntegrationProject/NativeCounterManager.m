//
//  NativeScreenMoveManager.m
//  IntegrationProject
//
//  Created by jongmin.lee on 2022/08/04.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(NativeScreenMoveManager, NSObject)

RCT_EXTERN_METHOD(moveProductDetail:(NSString *)productId)
RCT_EXTERN_METHOD(moveQADetail:(NSString*)qaId)
RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)date)

RCT_EXTERN_METHOD(increment:(RCTResponseSenderBlock)callback)
RCT_EXTERN_METHOD(decrement:(RCTPromiseResolveBlock)resolve reject:(RCTPromiseRejectBlock)reject)


@end
