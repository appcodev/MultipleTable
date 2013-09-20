//
//  OZViewController.m
//  MultipleTable
//
//  Created by Chalermchon Samana on 9/20/13.
//  Copyright (c) 2013 Onzondev Innovation Co., Ltd. All rights reserved.
//

#import "OZViewController.h"

@interface OZViewController (){
    
    IBOutlet UITextField *numberText;
    IBOutlet UITableView *tableResult;
    
    NSNumber *number;
}

@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    number = @2;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goMultiple:(UIButton *)sender {
    
    if (![numberText.text isEqualToString:@""]) {
        number = @(numberText.text.intValue);
        //NSLog(@"number %@",number);
        [tableResult reloadData];
    }
    
    [numberText resignFirstResponder];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 12;//fix
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"mCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *label1 = (UILabel*)[cell viewWithTag:1];
    label1.text = number.stringValue;
    
    UILabel *label2 = (UILabel*)[cell viewWithTag:2];
    int mul = indexPath.row+1;
    label2.text = [NSString stringWithFormat:@"%d",mul];
    
    UILabel *label3 = (UILabel*)[cell viewWithTag:3];
    int result = number.intValue*mul;
    label3.text = [NSString stringWithFormat:@"%d",result];
    
    return cell;
}


@end
