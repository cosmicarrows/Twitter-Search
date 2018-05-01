//
//  ViewController.m
//  Twitter Search
//
//  Created by Laurence Wingo on 12/27/12.
//  Copyright (c) 2012 Laurence Wingo. All rights reserved.
//

#import "ViewController.h"
#import "SBJson.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize layerPosition = _layerPosition;
@synthesize topLayer = _topLayer;
@synthesize tableView = _tableView;
@synthesize dataArray = _dataArray;
@synthesize dataArray2 = _dataArray2;
@synthesize sectionsArray = _sectionsArray;
@synthesize sliderNavBar = _sliderNavBar;
@synthesize titleView = _titleView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.topLayer.layer.shadowOffset = CGSizeMake(-1, 0);
    self.topLayer.layer.shadowOpacity = .9;
    self.topLayer.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.view.bounds].CGPath;
    
    // Do any additional setup after loading the view, typically from a nib.
    self.layerPosition = self.topLayer.frame.origin.x;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.dataArray = [NSMutableArray arrayWithObjects:@"", @"", @"", nil];
    //self.dataArray2 = [NSMutableArray arrayWithObjects:@"", @"", @"", nil];
    //self.sectionsArray = [NSMutableArray arrayWithObjects:_dataArray, _dataArray2, nil];
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 44.0)];
    
    //here for v, width= navBar width and height=navBar height
    [v setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"myschednav.png"]]];
     [self.topLayer addSubview:v];
    
    }

#define VIEW_HIDDEN 260

-(void)animateLayerToPoint:(CGFloat)x
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         CGRect frame = self.topLayer.frame;
                         frame.origin.x = x;
                         self.topLayer.frame = frame;
                     }
                     completion:^(BOOL finished){
                         self.layerPosition = self.topLayer.frame.origin.x;
                     }];
}
- (IBAction)toggleLayer:(id)sender
{
    
    if (self.layerPosition == VIEW_HIDDEN){
        [self animateLayerToPoint:0];
    }
    else {
        [self animateLayerToPoint:VIEW_HIDDEN];
    }
}

- (IBAction)panLayer:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [pan translationInView:self.topLayer];
        CGRect frame = self.topLayer.frame;
        frame.origin.x = self.layerPosition + point.x;
        if (frame.origin.x < 0) frame.origin.x = 0;
        self.topLayer.frame = frame;
        
    }
    if (pan.state == UIGestureRecognizerStateEnded){
        if (self.topLayer.frame.origin.x <= 160){
            [self animateLayerToPoint:0];
        } else {
            [self animateLayerToPoint: VIEW_HIDDEN];
        }
        
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %i", indexPath.row + 1];
    
    cell.detailTextLabel.text = @"2012";
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return 2;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UILabel *result = nil;
    
    if ([tableView isEqual:self.tableView] && section == 0){
        result = [[UILabel alloc]initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
        result.text = @"SHOW";
        result.textColor = [UIColor orangeColor];
        result.backgroundColor  = [UIColor brownColor];
        	result.font = [UIFont boldSystemFontOfSize:10];
        	//result.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
        //[result sizeToFit];
        
        
        
        
    }
    
    else if ([tableView isEqual:self.tableView] && section == 1){
        result = [[UILabel alloc]initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
        result.text = @"JUMP TO";
        result.backgroundColor  = [UIColor brownColor];
        result.textColor = [UIColor orangeColor];
        result.font = [UIFont boldSystemFontOfSize:10];
        //result.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
        //[result sizeToFit];
        
    }
    return  result;
        
    
        
    }
    
    



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
