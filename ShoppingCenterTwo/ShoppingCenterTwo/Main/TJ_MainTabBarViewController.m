//
//  TJ_MainTabBarViewController.m
//  ShoppingCenterTwo
//
//  Created by 周鑫 on 2018/11/16.
//  Copyright © 2018年 TJ. All rights reserved.
//

#import "TJ_MainTabBarViewController.h"


@interface TJ_MainTabBarViewController ()

@end

@implementation TJ_MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllChildViewController];
}

- (void)setupAllChildViewController {
    
    
}

- (void)addChildViewController:(UIViewController *)childVC title:(NSString *)title imageName:(NSString *)imageName selectImagenName:(NSString *)selectImageName {
    
    childVC.tabBarItem.title = title;
//    childVC.tabBarItem.image = [UIImage renderOriginalImageWithImageName:imageName];
//    childVC.tabBarItem.selectedImage = [UIImage renderOriginalImageWithImageName:selectImageName];
    
    TJ_BasicNavigationController *NavC = [[TJ_BasicNavigationController alloc]initWithRootViewController:childVC];
    [self addChildViewController:NavC];
}




@end
