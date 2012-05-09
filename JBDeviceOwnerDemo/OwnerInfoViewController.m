//
//  OwnerInfoViewController.m
//  JBDeviceOwner
//
//  Created by Steven Choi on 12-5-10.
//  Copyright (c) 2012年 Jake Boxer. All rights reserved.
//

#import "OwnerInfoViewController.h"
#import "JBDeviceOwner.h"

@interface OwnerInfoViewController ()
- (void)didGetOwner;
@end

@implementation OwnerInfoViewController
{
    NSArray *_titles;
    NSArray *_keys;
    JBDeviceOwner *_owner;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _titles = [NSArray arrayWithObjects:@"First Name", @"Full Name", @"Last Name", @"Middle Name", @"phone", @"email", nil];
        _keys = [NSArray arrayWithObjects:@"firstName", @"fullName", @"lastName", @"middleName", @"phone", @"email", nil];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            _owner = [[JBDeviceOwner alloc] initWithDevice:[UIDevice currentDevice]];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self didGetOwner]; 
            });
        });

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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_titles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    
    NSInteger index = indexPath.row;
    cell.textLabel.text = [_titles objectAtIndex:index];
    if (_owner) {
        cell.detailTextLabel.text = [_owner performSelector:NSSelectorFromString([_keys objectAtIndex:index])];
    } else {
        cell.detailTextLabel.text = @"loading...";        
    }
    return cell;
}


#pragma mark - Callback
- (void)didGetOwner
{
    if ([self isViewLoaded]) {
        [self.tableView reloadData];
    }
}
@end
