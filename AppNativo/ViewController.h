//
//  ViewController.h
//  AppNativo
//
//  Created by Leandro on 12/01/15.
//  Copyright (c) 2015 Facef. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,NSURLConnectionDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *search;
@property (strong, nonatomic) NSURLConnection *DownloadConnection;
@property (strong, nonatomic) NSMutableData *responseData;
@property (strong, nonatomic) NSMutableArray *arrDadosTela;
@property (strong, nonatomic) IBOutlet UITableView *tbDados;

@end

