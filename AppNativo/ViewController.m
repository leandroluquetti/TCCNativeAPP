//
//  ViewController.m
//  AppNativo
//
//  Created by Leandro on 12/01/15.
//  Copyright (c) 2015 Facef. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellAdress"];
    return cell;
}
- (IBAction)limparBusca:(id)sender {
    self.search.text=@"";
}
@end
