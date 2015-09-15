//
//  ViewController.h
//  UIPickerView
//
//  Created by rongfeng on 15/9/14.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)pickview:(UIButton *)sender;
- (IBAction)ablum:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *DisplayView;

@end

