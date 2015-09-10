//
//  MyDataService.h
//  天气预报
//
//  Created by kangkathy on 15/7/4.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import <Foundation/Foundation.h>


//工具类：实现网络申请

@interface MyDataService : NSObject


+ (void)requestData:(NSString *)urlString HTTPMethod:(NSString *)method completionHandle:(void (^) (id))block;

@end
