//
//  ViewController.m
//  NWModelDemo
//
//  Created by nate on 16/1/6.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+NWModel.h"
#import "UserEntity.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *dic = @{@"name": @"tom", @"image":@"wwww.he", @"time":@99292992};
    UserEntity *userEntity = [UserEntity nw_modelWithDic:dic];
    
    NSLog([NSString stringWithFormat:@"%@,%@", userEntity.name_1, userEntity.image]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
