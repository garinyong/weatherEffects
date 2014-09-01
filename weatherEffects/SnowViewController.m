//
//  SnowViewController.m
//  weatherEffects
//
//  Created by gaoyong on 14-9-1.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "SnowViewController.h"

@interface SnowViewController ()

@end

@implementation SnowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTaste];
}

-(void) addTaste
{
    //发射层
    CAEmitterLayer *rainEmitter = [CAEmitterLayer layer];
	rainEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);//发射源位置
	rainEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);//发射尺寸大小
	
	rainEmitter.emitterMode		= kCAEmitterLayerOutline;  //发射模式
	rainEmitter.emitterShape	= kCAEmitterLayerLine;     //发射形状
	
    //粒子
	CAEmitterCell *rainCell = [CAEmitterCell emitterCell];
    rainCell.contents		= (id) [[UIImage imageNamed:@"snow"] CGImage];
    rainCell.birthRate		= 5.0;
    rainCell.lifetime		= 20;
	
	rainCell.velocity		= -100;
	rainCell.velocityRange = 0;
	rainCell.yAcceleration = 2;
    rainCell.emissionRange = 0.5 * M_PI;
    rainCell.spinRange		= 0.5 * M_PI;
    rainCell.scale = 0.2;
    rainCell.color			= [[UIColor whiteColor] CGColor];
	
	rainEmitter.emitterCells = [NSArray arrayWithObject:rainCell];
	[self.view.layer insertSublayer:rainEmitter atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
