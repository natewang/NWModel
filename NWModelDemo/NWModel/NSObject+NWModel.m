//
//  NSObject+NWModel.m
//  NWModelDemo
//
//  Created by nate on 16/1/6.
//  Copyright © 2016年 nate. All rights reserved.
//

#import "NSObject+NWModel.h"
#import "objc/runtime.h"

@implementation NSObject (NWModel)

+(instancetype)nw_modelWithDic:(NSDictionary *)modelDic {
    
    id entity = [[self alloc]init];
    if (entity) {
        
        if ([entity propertyMapDic] == nil) {
            [entity assginToPropertyWithDictionary:modelDic];
        } else {
            [entity assginToPropertyWithNoMapDictionary:modelDic];
        }
    }
    return entity;
}

- (void)assginToPropertyWithDictionary:(NSDictionary*)modelDic
{
    NSArray *propertyArr = [self allPropertyNames];
    for (NSString *propertyStr in propertyArr) {
        
        if (!modelDic[propertyStr]) {
            continue;
        }
        [self setValue:modelDic[propertyStr] forKey:propertyStr];
    }
}

- (void)assginToPropertyWithNoMapDictionary:(NSDictionary *)modelDic
{
    ///获取字典和Model属性的映射关系
    NSDictionary *propertyMapDic = [self propertyMapDic];
    
    ///转化成key和property一样的字典，然后调用assginToPropertyWithDictionary方法
    
    NSArray *dicKey = [modelDic allKeys];
    
    
    NSMutableDictionary *tempDic = [[NSMutableDictionary alloc] initWithCapacity:dicKey.count];
    
    for (int i = 0; i < dicKey.count; i ++) {
        NSString *key = dicKey[i];
        
        if (propertyMapDic[key] != nil) {
            [tempDic setObject:modelDic[key] forKey:propertyMapDic[key]];
        } else {
            [tempDic setObject:modelDic[key] forKey:key];
        }
    }
    [self assginToPropertyWithDictionary:tempDic];
}
- (NSArray *)allPropertyNames{
    ///存储所有的属性名称
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    
    ///存储属性的个数
    unsigned int propertyCount = 0;
    
    ///通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    
    //把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        ///取出第一个属性
        objc_property_t property = propertys[i];
        const char * propertyName = property_getName(property);
        
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    ///释放
    free(propertys);
    
    return allNames;
}

-(NSDictionary *)propertyMapDic{
    return nil;
}

@end
