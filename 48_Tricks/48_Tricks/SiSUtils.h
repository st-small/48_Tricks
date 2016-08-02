//
//  SiSUtils.h
//  48_Tricks
//
//  Created by Stanly Shiyanovskiy on 23.07.16.
//  Copyright © 2016 Stanly Shiyanovskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#ifndef UTILS
#define UTILS

//#define PRODUCTION_BUILD
#define LOGS_NOTIFICATIONS_ENABLED 1

#define APP_SHORT_NAME @"TRICKS"

#define RGBA(r,g,b,a)[UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a/255.f];

extern NSString* const SiSLogNotification;
extern NSString* const SiSLogNotificationTextUserInfoKey;

typedef enum {
    SiSProgrammerTypeJunior,
    SiSProgrammerTypeMid,
    SiSProgrammerTypeSenior
} SiSProgrammerType;

NSString* fancyDateStringFromDate(NSDate* date);

BOOL iPad();
BOOL iPhone();

NSString* NSStringFromSiSProgrammerType(SiSProgrammerType type);

void SiSLog(NSString* format, ...);

#endif





