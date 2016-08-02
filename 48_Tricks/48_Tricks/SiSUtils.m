//
//  SiSUtils.m
//  48_Tricks
//
//  Created by Stanly Shiyanovskiy on 23.07.16.
//  Copyright © 2016 Stanly Shiyanovskiy. All rights reserved.
//

#import "SiSUtils.h"

NSString* const SiSLogNotification = @"com.sshiyanovskiy.SiSLogNotification";
NSString* const SiSLogNotificationTextUserInfoKey = @"com.sshiyanovskiy.SiSLogNotificationTextUserInfoKey";

NSString* fancyDateStringFromDate(NSDate* date) {
    
    static NSDateFormatter* formatter = nil;
    
    if (!formatter) {
        
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"-- dd : MM : yy --"];
    }
    
    return [formatter stringFromDate:date];
}

BOOL iPad() {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

BOOL iPhone() {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);    
}

NSString* NSStringFromSiSProgrammerType(SiSProgrammerType type) {
    
    switch (type) {
        case SiSProgrammerTypeJunior: return @"SiSProgrammerTypeJunior";
        case SiSProgrammerTypeMid: return @"SiSProgrammerTypeMid";
        case SiSProgrammerTypeSenior: return @"SiSProgrammerTypeSenior";
            
        default: return nil;
    }
}

void SiSLog(NSString* format, ...) {
    
#if LOGS_ENABLED
    
    va_list argumentList;
    va_start(argumentList, format);
    
    NSLogv(format, argumentList);
    
#if LOGS_NOTIFICATIONS_ENABLED
    
    NSString* log = [[NSString alloc] initWithFormat:format arguments:argumentList];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:SiSLogNotification
                                                        object:nil
                                                      userInfo:@{SiSLogNotificationTextUserInfoKey: log}];
    
#endif
    
    va_end(argumentList);
    
#endif
    
}






