//
//  AZViewController.m
//  AZEQDiagram
//
//  Created by Abner Zhong on 11/13/2014.
//  Copyright (c) 2014 Abner Zhong. All rights reserved.
//

#import "AZViewController.h"
#import <AZEQDiagram.h>

@interface AZViewController ()

@property(nonatomic, strong) AZEQDiagram *diagram;

@end

@implementation AZViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];

  self.diagram =
      [[AZEQDiagram alloc] initWithFrame:CGRectMake(100, 50, 120, 50)];
  self.diagram.color = [UIColor redColor];
  [self.diagram setColumn:10 andColumnWidth:10];
  [self.view addSubview:self.diagram];

  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.frame = CGRectMake(100, 220, 40, 40);
  [button setTitle:@"Jump" forState:UIControlStateNormal];
  [self.view addSubview:button];
  [button addTarget:self
                action:@selector(jump)
      forControlEvents:UIControlEventTouchUpInside];
}

- (void)jump {
  [self.diagram startAnimation];
}

@end
