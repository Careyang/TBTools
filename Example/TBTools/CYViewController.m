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
    NSLog(@"%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n",TBDeviceTool.DeviceType,
                                              TBDeviceTool.DeviceModel,
                                              TBDeviceTool.DeviceIDFA,
                                              TBDeviceTool.DeviceIDFV,
                                              TBDeviceTool.AppDisplayName,
                                              TBDeviceTool.AppBuildVersion,
                                              TBDeviceTool.AppBundleId,
                                              TBDeviceTool.AppVersion);}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
