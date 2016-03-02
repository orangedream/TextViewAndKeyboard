//
//  TableViewController.m
//  TextViewDoneKeyboard
//
//  Created by Orange Chang on 2016/3/2.
//  Copyright © 2016年 iOTEC. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)submitClicked:(id)sender {
    [self.textView resignFirstResponder];
}

@end
