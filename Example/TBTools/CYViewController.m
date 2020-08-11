//
//  CYViewController.m
//  TBTools
//
//  Created by mastercy919@hotmail.com on 12/21/2018.
//  Copyright (c) 2018 mastercy919@hotmail.com. All rights reserved.
//

#import "CYViewController.h"
#import "TBHeader.h"

@interface CYViewController ()

@end

@implementation CYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%ld\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n",TBDeviceTool.currentDeviceType,
                                              TBDeviceTool.deviceModel,
                                              TBDeviceTool.deviceIDFA,
                                              TBDeviceTool.deviceIDFV,
                                              TBDeviceTool.appDisplayName,
                                              TBDeviceTool.appBuildVersion,
                                              TBDeviceTool.appBundleId,
                                              TBDeviceTool.appVersion);

    [TBUITool setVersion:<#(NSInteger)#>]
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
