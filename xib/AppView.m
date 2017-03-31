//
//  AppView.m
//  xib
//
//  Created by 丫丫 on 17/3/31.
//  Copyright © 2017年 丫丫. All rights reserved.
//

#import "AppView.h"

@interface AppView ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *lblDesc;
- (IBAction)btnClicked:(UIButton *)sender;

@end

@implementation AppView

- (void) setObject:(AppObject *)object
{
    _object = object;
    
    _imgView.image = [UIImage imageNamed:object.icon];
    _lblDesc.text = object.name;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)btnClicked:(UIButton *)sender {
    sender.enabled = NO;
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"下载中。。。。。。";
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor greenColor];
    label.frame = CGRectMake(90, 400, 200, 30);
    label.textAlignment = NSTextAlignmentCenter;
    label.alpha = 0.3;
    label.layer.cornerRadius = 5;
    label.layer.masksToBounds = YES;
    
    [UIView animateWithDuration:1.5 animations:^
     {
         label.alpha = 0.6;
     }completion:^(BOOL finished)
     {
         if (finished)
         {
             [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionCurveLinear animations:^
              {
                  label.alpha = 0;
              }completion:^(BOOL finished)
              {
                 if (finished)
                 {
                     [label removeFromSuperview];
                 }
              }];
         }
     }];
    
    [self.superview addSubview:label];
}
@end
