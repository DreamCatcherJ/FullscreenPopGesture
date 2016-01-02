//
//  JCOne.m
//  myPush
//
//  Created by mac on 16/1/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "JCOne.h"
#import "JCTwo.h"


@interface JCOne ()

@end

@implementation JCOne

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"push" style:UIBarButtonItemStyleDone target:self action:@selector(onClickPush)];
    
    self.navigationItem.rightBarButtonItem = item;
    
}

- (void)onClickPush{

    JCTwo *two = [[JCTwo alloc] init];
    
    [self.navigationController pushViewController:two animated:YES];
    
}

@end
