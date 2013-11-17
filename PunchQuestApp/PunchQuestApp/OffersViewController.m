//
//  DetailViewController.m
//  PunchQuestApp
//
//  Created by Simon Tseng on 11/16/2013.
//  Copyright (c) 2013 Simon. All rights reserved.
//

#import "OffersViewController.h"
#import "TPGestureTableViewCell.h"
#import "TPDataModel.h"

@interface OffersViewController ()
@property (nonatomic,retain) UITableView *myTableView;
@property (nonatomic,retain) NSMutableArray *dataArray;
@property (nonatomic,retain) TPGestureTableViewCell *currentCell;
@end

@implementation OffersViewController

@synthesize user;

-(void)dealloc{
    self.myTableView=nil;
    self.dataArray=nil;
    self.currentCell=nil;
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    
//    NSString *phpLink = [NSString stringWithFormat: @"http://www.rent2play.ca/testing/api/responses/%d", [user getRequestID]];
    NSString *phpLink = [NSString stringWithFormat: @"http://www.rent2play.ca/testing/api/responses/%d", 1];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData* data = [NSData dataWithContentsOfURL:[NSURL URLWithString:phpLink]];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });

	
}

- (void)fetchedData:(NSData *)responseData {
    NSArray* json = [NSJSONSerialization
                     JSONObjectWithData:responseData //1
                     options:kNilOptions error:nil];
    NSLog(@"json: %@", json);
    
    

    _dataArray = [[NSMutableArray alloc]init];

    
    NSArray *sourceArray = json;
    
    for(int i=0;i<[sourceArray count];i++){
        NSDictionary *dict = [sourceArray objectAtIndex:i];
        TPDataModel *item = [[TPDataModel alloc]init];
        item.title = [dict objectForKey:@"storeName"];
        item.detail = [dict objectForKey:@"message"];
        item.isExpand=NO;
        [_dataArray addObject:item];
    }

    
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,60,
                                                                self.view.frame.size.width,
                                                                self.view.frame.size.height/3)];
    _myTableView.delegate=self;
    _myTableView.dataSource=self;
    _myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _myTableView.backgroundColor=[UIColor darkGrayColor];
    [self.view addSubview:_myTableView];
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark
#pragma mark UITableViewDatasource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TPDataModel *item=(TPDataModel*)[_dataArray objectAtIndex:indexPath.row];
    if(item.isExpand==NO){
        return 60;
    }
    return 100;
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"LomemoBasicCell";
    TPGestureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[TPGestureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.delegate=self;
    }
    TPDataModel *item=(TPDataModel*)[_dataArray objectAtIndex:indexPath.row];
    cell.itemData=item;
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TPGestureTableViewCell *cell = (TPGestureTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    if(cell.revealing==YES){
        cell.revealing=NO;
        return;
    }
    TPDataModel *item=(TPDataModel*)[_dataArray objectAtIndex:indexPath.row];
    item.isExpand=!item.isExpand;
    cell.itemData=item;
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark
#pragma mark TPGestureTableViewCellDelegate
- (void)cellDidBeginPan:(TPGestureTableViewCell *)cell{
    NSLog(@"cell begin pan: %u",[cell currentStatus]);
}

- (void)cellDidReveal:(TPGestureTableViewCell *)cell{
    if(self.currentCell!=cell){
        self.currentCell.revealing=NO;
        self.currentCell=cell;
    }
        NSLog(@"cell did reveal: %u", [cell currentStatus]);
    
    // 3 is right, 1 is left
    
    
}



@end
