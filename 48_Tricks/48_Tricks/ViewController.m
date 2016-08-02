//
//  ViewController.m
//  48_Tricks
//
//  Created by Stanly Shiyanovskiy on 23.07.16.
//  Copyright © 2016 Stanly Shiyanovskiy. All rights reserved.
//

#import "ViewController.h"
#import "SiSUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#ifndef PRODUCTION_BUILD
    
    NSLog(@"%@", fancyDateStringFromDate([NSDate date]));
    
        if (iPad()) {
            SiSLog(@"iPad");
        } else {
            SiSLog(@"iPhone");
        }
    
    //NSLog(@"%@", NSStringFromSiSProgrammerType(SiSProgrammerTypeSenior));
    
    //NSLog(@"%@", APP_SHORT_NAME);
    
    self.view.backgroundColor = RGBA(155, 200, 120, 250);
    
#else
    
    NSLog(@"PRODUCTION_BUILD");
    
#endif
    
    [[NSNotificationCenter defaultCenter]
            addObserverForName:SiSLogNotification
            object:nil
            queue:[NSOperationQueue mainQueue]
            usingBlock:^(NSNotification * notif) {
                self.consoleView.text = [NSString stringWithFormat:@"%@\n%@", self.consoleView.text, [notif.userInfo objectForKey:SiSLogNotificationTextUserInfoKey]];
            }];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)actionTest:(id)sender {
    
    SiSLog(@"actionTest");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
