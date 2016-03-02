//
//  ViewController.m
//  TextViewDoneKeyboard
//
//  Created by CHYAU FUH CHANG on 2016/2/25.
//  Copyright © 2016年 iOTEC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomHeightConstraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.layer.borderWidth=1;
    [self observeKeyboard];
    self.automaticallyAdjustsScrollViewInsets=NO; // avoid the
}
- (void)observeKeyboard {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillChangeFrameNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.textView.contentOffset=CGPointMake(0,0);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - button events
- (IBAction)submitClicked:(id)sender {
    NSLog(@"textView.text=%@",self.textView.text);
    [self debugViewSize:self.textView withTag:@"textView"];
    [self debugCGPoint:self.textView.contentOffset WithFormat:@""];
    [self.textView resignFirstResponder];
}

#pragma mark - keyboard handling
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    NSValue *kbFrame = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardFrame = [kbFrame CGRectValue];
    
    CGFloat height = keyboardFrame.size.height;
    
    self.bottomHeightConstraint.constant = height+20;
    
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    self.bottomHeightConstraint.constant = 20;
    [UIView animateWithDuration:animationDuration animations:^{
        [self.view layoutIfNeeded];
    }];
}

-(void) debugViewSize:(UIView *) view withTag:(NSString *) tag
{
    NSLog(@"[%@] (%.0f,%.0f,%.0f,%.0f)"
          ,tag
          ,view.frame.origin.x
          ,view.frame.origin.y
          ,view.frame.size.width
          ,view.frame.size.height
          );
}

-(void) debugCGPoint:(CGPoint) point WithFormat:(NSString *) format,...
{
    va_list arguments;
    
    va_start(arguments,format);
    
    id result;
    
    result=[[NSString alloc] initWithFormat:format arguments:arguments];
    va_end(arguments);
    
    NSLog(@"[CGPoint] (%f,%f) %@",point.x,point.y,result);
}

@end
