//
//  AccountTool.m
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/29.
//  Copyright © 2015年 lwl. All rights reserved.
//

#import "AccountTool.h"
#import "AccountModel.h"

#define kAccountFilePath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archiver"]

@implementation AccountTool

+(void)saveAccount:(AccountModel *)model{
    // 将模型对象存进沙盒,自定义的对象存储必须用NSKeyedArchiver，不再用writeToFile方法
    [NSKeyedArchiver archiveRootObject:model toFile:kAccountFilePath];
}

+(AccountModel *)account{
    AccountModel *model = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountFilePath];
    
    // 验证帐号是否过期
    // 过期的秒数
    long long expires_in = [model.expires_in longLongValue];
    // 获得过期时间
    NSDate *expiresTime = [model.created_time dateByAddingTimeInterval:expires_in];
    
    // 获取当前时间
    NSDate *now = [NSDate date];
    
    // 比较两个时间,如果now >= expiresTime 过期
    // NSOrderedAscending = -1L,  升序，右边 > 左边
    // NSOrderedSame,             相等
    // NSOrderedDescending        降序, 左边 > 右边
    NSComparisonResult result = [expiresTime compare:now];
    if (result != NSOrderedDescending) {
        return nil;
    }
    
    return model;
}

@end
