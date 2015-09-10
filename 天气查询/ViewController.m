//
//  ViewController.m
//  天气查询
//
//  Created by rongfeng on 15/9/7.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import "ViewController.h"
#import "MyDataService.h"

@interface ViewController ()

@end

@implementation ViewController {
    UILabel *label ;
//    CLGeocoder *geocoder ;
//    CLLocationCoordinate2D mylocation;
    NSString *_intString;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(130, 100, 100, 50)];
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"点击查询" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //http://61.4.185.48:81/g/
    //http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js
    //解析网址通过ip 获取城市代码
    NSURL *url = [NSURL URLWithString:@"http://61.4.185.48:81/g/"];
    
    //定义一个NSError对象，用于捕获错误信息
    NSError *error;
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    NSLog(@"------------%@",jsonString);
    if (error) {
        NSLog(@"%@",error);
    }
    // 得到城市代码字符串，截取出城市代码
    NSString *Str;
    for (int i = 0; i<=[jsonString length]; i++)
    {
        for (int j = i+1; j <=[jsonString length]; j++)
        {
            Str = [jsonString substringWithRange:NSMakeRange(i, j-i)];
            if ([Str isEqualToString:@"id"]) {
                if (![[jsonString substringWithRange:NSMakeRange(i+3, 1)] isEqualToString:@"c"]) {
                    _intString = [jsonString substringWithRange:NSMakeRange(i+3, 9)];
                    NSLog(@"***%@***",_intString);
                }
            }
        }
    }

}

- (void)clickAction {
    //杭州id————101210101
    NSString *url = [NSString stringWithFormat:@"http://www.weather.com.cn/adat/sk/%@.html",_intString];
    [MyDataService requestData:url HTTPMethod:@"get" completionHandle:^(id result) {
        NSLog(@"%@", result);
        //更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [self refreshUI:result];
        });
    }];

}


- (void)refreshUI:(NSDictionary *)result {
    
    NSDictionary *weatherInfo = result[@"weatherinfo"];
    
    NSString *city = weatherInfo[@"city"];
    NSString *temp = weatherInfo[@"temp"];
    NSString *windLevel = weatherInfo[@"WS"];
    NSString *windDirection = weatherInfo[@"WD"];
    NSString *time = weatherInfo[@"time"];
    NSString *unkonw = weatherInfo[@"njd"];
    
    self.cityLabel.text = city;
    self.CLabel.text = temp;
    self.FXLabel.text = windDirection;
    self.FJLabel.text = windLevel;
    self.SBLabel.text = time;
    self.SKLabel.text = unkonw;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
