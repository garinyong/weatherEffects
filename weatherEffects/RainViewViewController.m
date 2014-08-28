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
    // Do any additional setup after loading the view.
    // Configure the particle emitter to the top edge of the screen
	CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
	snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);
	snowEmitter.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
	
	// Spawn points for the flakes are within on the outline of the line
	snowEmitter.emitterMode		= kCAEmitterLayerOutline;
	snowEmitter.emitterShape	= kCAEmitterLayerLine;
	
	// Configure the snowflake emitter cell
	CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
	
	snowflake.birthRate		= 80;
	snowflake.lifetime		= 40.0;
    snowflake.scale = 0.1;
    
    snowflake.scaleSpeed = 0.01;
	
	snowflake.velocity		= 70;				// falling down slowly
//	snowflake.velocityRange = 5;
	snowflake.yAcceleration = 60;
//	snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
//	snowflake.spinRange		= 0.25 * M_PI;		// slow spin
	
	snowflake.contents		= (id) [[UIImage imageNamed:@"yudi"] CGImage];
	snowflake.color			= [[UIColor colorWithRed:112/255.0 green:148/255.0 blue:176/255.0 alpha:1] CGColor];
    
	// Make the flakes seem inset in the background
	snowEmitter.shadowOpacity = 1.0;
	snowEmitter.shadowRadius  = 0.0;
	snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
	snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
	
	// Add everything to our backing layer below the UIContol defined in the storyboard
	snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
	[self.view.layer insertSublayer:snowEmitter atIndex:0];
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
