//
//  MyDataService.m
//  天气预报
//
//  Created by kangkathy on 15/7/4.
//  Copyright (c) 2015年 huiwen. All rights reserved.
//

#import "MyDataService.h"

@implementation MyDataService


+ (void)requestData:(NSString *)urlString HTTPMethod:(NSString *)method completionHandle:(void (^)(id))block{
    
    //1.拼接URL
    NSURL *requestURL = [NSURL URLWithString:urlString];
    
    //2.创建网络请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:requestURL];
    
    
    request.HTTPMethod = method;
    
    //3.发送请求
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSLog(@"error:%@", connectionError);
        
        if (data != nil) {
            NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            //return jsonDic;
            //涉及到事件的传递,回调block
            block(jsonDic);
            
            
        }
        
    
    }];
    
    //return jsonDic;
    
    
}

@end
