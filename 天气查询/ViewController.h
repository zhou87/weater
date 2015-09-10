//
//  ViewController.h
//  天气查询
//
//  Created by rongfeng on 15/9/7.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property(nonatomic,retain)CLLocationManager *Manager;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *CLabel;
@property (weak, nonatomic) IBOutlet UILabel *SBLabel;
@property (weak, nonatomic) IBOutlet UILabel *FXLabel;
@property (weak, nonatomic) IBOutlet UILabel *FJLabel;
@property (weak, nonatomic) IBOutlet UILabel *SKLabel;

@end

