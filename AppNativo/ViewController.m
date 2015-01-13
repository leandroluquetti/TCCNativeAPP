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

    return [_arrDadosTela count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

   UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellAdress"];
    NSDictionary *dictAddress = [_arrDadosTela objectAtIndex:indexPath.row];
    [cell.detailTextLabel setText:[dictAddress objectForKey:@"chave"]];
    [cell.textLabel setText:[dictAddress objectForKey:@"detalhe"]];
    return cell;
}
- (IBAction)limparBusca:(id)sender {
    self.search.text=@"";
}

-(IBAction)buscaEndereco:(id)sender{
    NSURLComponents *urlComp = [NSURLComponents componentsWithString:@"http://maps.googleapis.com"];
    [urlComp setPath:@"/maps/api/geocode/json"];
    [urlComp setQuery:[NSString stringWithFormat:@"address=%@",self.search.text]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[urlComp URL]];
    [request setCachePolicy:NSURLRequestUseProtocolCachePolicy];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    _DownloadConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    _responseData = [[NSMutableData alloc] init];
    _arrDadosTela = [[NSMutableArray alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
   [_responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary *googleResponse = [NSJSONSerialization JSONObjectWithData:_responseData options:NSJSONReadingMutableContainers error:nil];
    NSArray *address = [[googleResponse objectForKey:@"results"][0] objectForKey:@"address_components"];
    for (int i=0; i<[address count]; i++) {
        NSDictionary *dictAdress = [address objectAtIndex:i];
        [_arrDadosTela addObject:@{@"chave":[[dictAdress objectForKey:@"types"] objectAtIndex:0],@"detalhe":[dictAdress objectForKey:@"long_name"]}];
    }
    [_tbDados reloadData];
}
@end
