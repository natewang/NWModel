//
//  UserEntity.h
//  NWModelDemo
//
//  Created by nate on 16/1/6.
//  Copyright © 2016年 nate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+NWModel.h"


@interface UserEntity : NSObject

@property (nonatomic, copy) NSString *name_1;
@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger time;

@end
