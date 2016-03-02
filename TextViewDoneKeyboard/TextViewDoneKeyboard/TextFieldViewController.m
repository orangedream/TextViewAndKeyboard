//
//  TextFieldViewController.m
//  TextViewDoneKeyboard
//
//  Created by Orange Chang on 2016/3/2.
//  Copyright © 2016年 iOTEC. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *textField;

@end

@implementation TextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 將按鍵設為 Done
    [self.textField setReturnKeyType:UIReturnKeyDone];
    
    // 將 textfield.delegate 設為自己
    self.textField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 實作 textFieldShouldReturn 來降下 keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
