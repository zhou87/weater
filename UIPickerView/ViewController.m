//
//  ViewController.m
//  UIPickerView
//
//  Created by rongfeng on 15/9/14.
//  Copyright (c) 2015年 rongfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additinal setup after loading the view, typically from a nib.
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(50, 50, 200, 100)];
    //[self.view addSubview:pickerView];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 5;
    }
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = [NSString stringWithFormat:@"%li:%li",component,row];
    return title;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 60;
    
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"%li,%li",component,row);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pickview:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    [self presentViewController:picker animated:YES completion:nil];
    
    
}


- (IBAction)ablum:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    BOOL isCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    
    if (!isCamera) {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"提示" message:@"设备没有摄像头" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alertview show];
        return;
    }
    
    [self presentViewController:picker animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    NSLog(@"info:%@",info);
    
    _DisplayView.image = info[UIImagePickerControllerOriginalImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    
    
}
@end
