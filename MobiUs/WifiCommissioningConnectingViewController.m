//
//  WifiCommissioningConnectingViewController.m
//  MobiUs
//
//  Created by Myles Caley on 12/18/14.
//  Copyright (c) 2014 FirstBuild. All rights reserved.
//

#import "WifiCommissioningConnectingViewController.h"
#import "FSTDevice.h"
#import "FirebaseShared.h"
#import <Firebase/Firebase.h>


@interface WifiCommissioningConnectingViewController ()

@end

@implementation WifiCommissioningConnectingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)cancelSearch:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:true];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Do any additional setup after loading the view.
    Firebase *addRef = [[[FirebaseShared sharedInstance] userBaseReference] childByAppendingPath:[@"devices/chillhubs/" stringByAppendingString:self.device.uuid]];
    [addRef removeAllObservers];
    [addRef observeSingleEventOfType:FEventTypeChildAdded withBlock:^(FDataSnapshot *snapshot) {
        [self performSegueWithIdentifier:@"segueFound" sender:self];
    }];
    
    // cancel after a minute
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(60 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [addRef removeAllObservers];
        [self performSegueWithIdentifier:@"segueNotFound" sender:self];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
