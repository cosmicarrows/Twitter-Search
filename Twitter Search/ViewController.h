//
//  ViewController.h
//  Twitter Search
//
//  Created by Laurence Wingo on 12/27/12.
//  Copyright (c) 2012 Laurence Wingo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *topLayer;
@property (nonatomic) CGFloat layerPosition;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;


@property (nonatomic, strong) NSMutableArray *dataArray2;
@property (nonatomic, strong) NSMutableArray *sectionsArray;

@property (strong, nonatomic) IBOutlet UINavigationBar *sliderNavBar;

@property(nonatomic, retain) UIView *titleView;


@end
