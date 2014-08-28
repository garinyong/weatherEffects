//
//  ParallaxViewController.m
//  iosTestOc
//
//  Created by gaoyong on 14-8-27.
//  Copyright (c) 2014年 gaoyong. All rights reserved.
//

#import "ParallaxViewController.h"

@interface ParallaxViewController ()

@end

@implementation ParallaxViewController

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
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    picWidth = 512;
    picHeight = 348;
    
    containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, 200)];
    containerView.backgroundColor = [UIColor clearColor];
    containerView.clipsToBounds = YES;
    [self.view addSubview:containerView];
    
    imgView = [[UIImageView alloc] initWithFrame:containerView.bounds];
    imgView.contentMode = UIViewContentModeLeft;
    imgView.image = [UIImage imageNamed:@"cloud.png"];
//    imgView.transform = CGAffineTransformMakeScale(3, 3);
    [containerView addSubview:imgView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(320/2-30,320,60, 44);
    btn.layer.borderColor =[UIColor blueColor].CGColor;
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [btn setTitle:@"click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void) btnClick
{
    [self annimateWithTransform];
}

-(void) annimateWithTransform
{
    CGPoint startPoint = CGPointMake(imgView.layer.position.x, imgView.layer.position.y);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:startPoint];

    //方向
    BOOL isToLeft = YES;
    
    CGPoint endPoint;
    CGPoint p1;
    CGPoint p2;
    //移动的最大距离(和初始位置有关)
    int maxX = (picWidth - imgView.layer.frame.size.width);
    int maxY = 20;
    if (isToLeft)
    {
        endPoint = CGPointMake(startPoint.x-maxX, arc4random()%100%2==0?startPoint.y+arc4random()%maxY:startPoint.y-arc4random()%maxY);
        p1 = CGPointMake(startPoint.x - arc4random()%maxX, arc4random()%100%2==0?startPoint.y+arc4random()%maxY:startPoint.y-arc4random()%maxY);
        p2 = CGPointMake(startPoint.x - arc4random()%maxX, arc4random()%100%2==0?startPoint.y+arc4random()%maxY:startPoint.y-arc4random()%maxY);
    }
    else
    {
        endPoint = CGPointMake(startPoint.x+maxX, arc4random()%100%2==0?startPoint.y+arc4random()%maxY:startPoint.y-arc4random()%maxY);
        p1 = CGPointMake(startPoint.x + arc4random()%maxX, arc4random()%100%2==0?startPoint.y+arc4random()%maxY:startPoint.y-arc4random()%maxY);
        p2 = CGPointMake(startPoint.x + arc4random()%maxX, arc4random()%100%2==0?startPoint.y+arc4random()%maxY:startPoint.y-arc4random()%maxY);
    }
    
    NSLog(@"startPoint x:%f startPoint y:%f",startPoint.x,startPoint.y);
    NSLog(@"p1 x:%f p1 y:%f",p1.x,p1.y);
    NSLog(@"p2 x:%f p2 y:%f",p2.x,p2.y);
    NSLog(@"endPoint x:%f endPoint y:%f",endPoint.x,endPoint.y);
    
    [path addCurveToPoint:endPoint controlPoint1:p1 controlPoint2:p2];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [animation setPath:path.CGPath];
    
    CGFloat from3DScale = 1 + arc4random() % 2 *0.1;
    CGFloat to3DScale = from3DScale * 0.8;
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)],[NSValue valueWithCATransform3D:CATransform3DMakeScale(from3DScale, from3DScale, from3DScale)], [NSValue valueWithCATransform3D:CATransform3DMakeScale(to3DScale, to3DScale, to3DScale)],
                              [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
//    scaleAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.duration = 100;
//    group.fillMode = kCAFillModeForwards;
//    group.removedOnCompletion = NO;
    group.animations = @[animation,scaleAnimation];
    group.autoreverses = YES;
    group.repeatCount = HUGE_VALL;
    [imgView.layer addAnimation:group forKey:@"position and transform"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag)
    {
        NSLog(@"wanchen");
    }
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
