//
//  sortCtrl.m
//  test
//
//  Created by jackson wang on 12-3-1.
//  Copyright (c) 2012年 carryquote. All rights reserved.
//

#import "sortCtrl.h"

@implementation sortCtrl

@synthesize array;
@synthesize _tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.array = [NSArray arrayWithObjects:@"C",@"c",@"A",@"a",@"b",@"B",nil];  
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)sort{
    NSLog(@"start*****************************");
    self.array = 
    [self.array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSLog(@"%d",[obj1 compare:obj2]);
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch];
    }];
    NSLog(@"stop*****************************");
}
/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIButton *btn = [UIButton buttonWithType:0];
    btn.frame = CGRectMake(0, 0, 100, 40);
    [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, 420) style:0];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self._tableView = tableView;
    [tableView release];
}

-(void)buttonAction:(id)sender{
    [self sort];
    [self._tableView reloadData];
}


#pragma mark - 
#pragma mark UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.array count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *Identifier = @"normal";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if ( cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:Identifier] autorelease];
    }
    cell.textLabel.text = [self.array objectAtIndex:[indexPath row]];
    return cell;
}

@end
