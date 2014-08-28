//
//  HomeViewController.h
//  iosTestOc
//
//  Created by gaoyong on 14-8-21.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArr;
}


@property (weak, nonatomic) IBOutlet UITableView *indexesTableView;

@end
