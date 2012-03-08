//
//  sortCtrl.h
//  test
//
//  Created by jackson wang on 12-3-1.
//  Copyright (c) 2012年 carryquote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface sortCtrl : UIViewController
<UITableViewDataSource>

@property(nonatomic,retain)NSArray *array;
@property(nonatomic,assign)UITableView *_tableView;

-(void)sort;

@end
