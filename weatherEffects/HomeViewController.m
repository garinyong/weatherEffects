//
//  HomeViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-21.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "HomeViewController.h"
#import "ParallaxViewController.h"
#import "RainViewViewController.h"
#import "SnowViewController.h"
#import "SunnyViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    // Do any additional setup after loading the view from its nib.
    
    dataArr = [NSArray arrayWithObjects:@"多云",@"晴天",@"下雨",@"下雪",nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identfider = @"temCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfider];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identfider];
    }
    
    cell.textLabel.text = [dataArr objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -- UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ParallaxViewController *vc = [ParallaxViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1:
        {
            SunnyViewController *vc = [SunnyViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2:
        {
            RainViewViewController *vc = [RainViewViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3:
        {
            SnowViewController *vc = [SnowViewController new];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end
