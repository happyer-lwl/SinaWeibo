//
//  AccountTool.h
//  SinaWeibo
//
//  Created by 刘伟龙 on 15/11/29.
//  Copyright © 2015年 lwl. All rights reserved.
//  处理帐号相关的所有操作, 存储  读取帐号

#import <Foundation/Foundation.h>
#import "AccountModel.h"

@interface AccountTool : NSObject

/**
 *  存储帐号信息
 *
 *  @param model 帐号模型
 */
+(void)saveAccount:(AccountModel*)model;
/**
 *  读取帐号信息
 *
 *  @return 帐号模型, 如果帐号过期，返回nil
 */
+(AccountModel *)account;

@end
