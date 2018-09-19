//
//  ViewController.m
//  SJOrentationObserverProject
//
//  Created by BlueDancer on 2017/12/9.
//  Copyright © 2017年 SanJiang. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerRotateController.h"
#import "ViewRotateController.h"


@interface ViewController ()

@end

@implementation ViewController
- (IBAction)veiw_rotation:(id)sender {
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewRotateController"] animated:YES];
}
- (IBAction)viewController_rotation:(id)sender {
    [self.navigationController pushViewController:[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewControllerRotateController"] animated:YES];
}
@end
