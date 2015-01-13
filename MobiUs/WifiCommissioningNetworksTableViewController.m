//
//  WifiCommissioningNetworksTableViewController.m
//  MobiUs
//
//  Created by Myles Caley on 1/13/15.
//  Copyright (c) 2015 FirstBuild. All rights reserved.
//

#import "WifiCommissioningNetworksTableViewController.h"
#import "WifiCommissioningNetworkListViewController.h"
#import "WifiCommissioningNetworkTableViewCell.h"
#import <RestKit.h>
#import "FSTNetwork.h"

@interface WifiCommissioningNetworksTableViewController ()

@end

@implementation WifiCommissioningNetworksTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadNetworks];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.networks.count;
}

- (void)loadNetworks
{
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/networks"
                                           parameters:nil
                                              success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                                                  _networks = mappingResult.array;
                                                  [self.tableView reloadData];
                                                  if (_networks.count==0)
                                                  {
                                                      //[self performSegueWithIdentifier:@"segueErrorNetworks" sender:self];
                                                  }
                                              }
                                              failure:^(RKObjectRequestOperation *operation, NSError *error) {
                                                  //[self performSegueWithIdentifier:@"segueErrorNetworks" sender:self];
                                              }];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WifiCommissioningNetworkTableViewCell *cell = (WifiCommissioningNetworkTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"NetworkCell" forIndexPath:indexPath];
    FSTNetwork *network = _networks[indexPath.item];
    cell.label.text = network.ssid;
    return cell;
}

 -(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WifiCommissioningNetworkListViewController* parentController = (WifiCommissioningNetworkListViewController*)self.parentViewController;
    parentController.selectedNetwork = _networks[indexPath.item];
    [parentController performSegueWithIdentifier:@"passwordSegue" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end