//
//  ViewController.h
//  AppNativo
//
//  Created by Leandro on 12/01/15.
//  Copyright (c) 2015 Facef. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *search;

@end

