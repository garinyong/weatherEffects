//
//  RainViewViewController.m
//  weatherEffects
//  下雨
//  Created by gaoyong on 14-8-28.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "RainViewViewController.h"

@interface RainViewViewController ()

@end

@implementation RainViewViewController

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
    
    self.view.backgroundColor = [UIColor colorWithRed:58/255.0 green:99/255.0 blue:132/255.0 alpha:1];

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
    rainCell.contents		= (id) [[UIImage imageNamed:@"CUSSenderRain"] CGImage];
	rainCell.color			= [[UIColor colorWithRed:112/255.0 green:148/255.0 blue:176/255.0 alpha:1] CGColor];
    
    rainCell.emissionLongitude = 0.01 * M_PI;
//    rainCell.spin = 0.1 * M_PI;
    
    rainCell.birthRate		= 40;    //每s 发射的粒子个数
	rainCell.lifetime		= 8.0;   //每个粒子显示的时间
    rainCell.lifetimeRange  = 2;     //变化幅度
    rainCell.scale = 0.13;
	rainCell.velocity		= -1000; //速度
    
	rainEmitter.shadowOpacity = 1.0;
	rainEmitter.shadowRadius  = 0.0;
	rainEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
	rainEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
	
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
