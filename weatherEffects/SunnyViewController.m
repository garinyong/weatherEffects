//
//  SunnyViewController.m
//  weatherEffects
//
//  Created by gaoyong on 14-9-1.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "SunnyViewController.h"

@interface SunnyViewController ()

@end

@implementation SunnyViewController

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
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 66, 320, self.view.bounds.size.height -66)];
    img.image = [UIImage imageNamed:@"sun.jpg"];
    img.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:img];
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
