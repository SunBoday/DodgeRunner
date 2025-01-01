//
//  UIViewController+Ext.h
//  DodgeRunner
//
//  Created by SunTory on 2025/1/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (Ext)
+ (NSString *)runnerGetUserDefaultKey;

+ (void)runnerSetUserDefaultKey:(NSString *)key;

- (void)runnerSendEvent:(NSString *)event values:(NSDictionary *)value;

+ (NSString *)runnerAppsFlyerDevKey;

- (NSString *)runnerHostUrl;

- (BOOL)runnerNeedShowAdsView;

- (void)runnerShowAdView:(NSString *)adsUrl;

- (void)runnerSendEventsWithParams:(NSString *)params;

- (NSDictionary *)runnerJsonToDicWithJsonString:(NSString *)jsonString;

- (void)runnerAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr;

- (void)runnerAfSendEventWithName:(NSString *)name value:(NSString *)valueStr;

- (void)moveView:(UIView *)view toPoint:(CGPoint)point withDuration:(NSTimeInterval)duration;

- (void)moveViewHorizontally:(UIView *)view byOffset:(CGFloat)offset withDuration:(NSTimeInterval)duration;

- (void)moveViewVertically:(UIView *)view byOffset:(CGFloat)offset withDuration:(NSTimeInterval)duration;


@end

NS_ASSUME_NONNULL_END
