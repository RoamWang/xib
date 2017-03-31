//
//  ViewController.m
//  xib
//
//  Created by 丫丫 on 17/3/31.
//  Copyright © 2017年 丫丫. All rights reserved.
//

#import "ViewController.h"
#import "AppObject.h"
#import "AppView.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *apps;
@end

@implementation ViewController

- (NSArray *)apps
{
    if (_apps == nil)
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *objects = [[NSMutableArray alloc]init];
        for (NSDictionary *dic in array)
        {
            AppObject *obj = [AppObject appWithDict:dic];
            [objects addObject:obj];
        }
        _apps = objects;
    }
    return _apps;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    int column = 3;
    CGFloat totalWidth = self.view.frame.size.width;
    CGFloat width = 75, height = 90;
    CGFloat top = 30;
    CGFloat marginX = (totalWidth - column * width) / (column + 1);
    CGFloat marginY = marginX;
    
    NSBundle *rootBundle = [NSBundle mainBundle];
    for (int i = 0; i < self.apps.count; i++)
    {
        AppObject *obj = self.apps[i];
        
        
        AppView *appView = [[rootBundle loadNibNamed:@"AppView" owner:nil options:nil] lastObject];
        
        int col = i % column, row = i / column;
        CGFloat appX = marginX + col * (width + marginX);
        CGFloat appY = top + row * (height + marginY);
        appView.frame = CGRectMake(appX, appY, width, height);
        
        [self.view addSubview:appView];
        
        appView.object = obj;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
