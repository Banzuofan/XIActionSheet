//
//  ViewController.m
//  XIActionSheet
//
//  Created by YXLONG on 16/7/21.
//  Copyright © 2016年 yxlong. All rights reserved.

#import "ViewController.h"
#import "XIAlertView.h"
#import "XIActionSheetHeaderView.h"
#import "XIActionSheet.h"
#import "XIActionSheetButtonItem.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *contentTable;
@end

@implementation ViewController
{
    NSArray *items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    items = @[
              @"System ActionSheet",
              @"Custom ActionSheet",
              @"ActionSheet-Buttons-6",
              @"ActionSheet-Buttons-more than 6",
              @"ActionSheet-Text-short",
              @"ActionSheet-Text-long",
              @"Disable blur"];
    
    _contentTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _contentTable.backgroundColor = [UIColor clearColor];
    _contentTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _contentTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    _contentTable.delegate = self;
    _contentTable.dataSource = self;
    [self.view addSubview:_contentTable];
    _contentTable.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _contentTable.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table_bg"]];
    
    UISwitch *bgSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(15, 20, 0, 0)];
    bgSwitch.on = YES;
    [self.view addSubview:bgSwitch];
    [bgSwitch addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChanged:(UISwitch *)switchC
{
    if(switchC.isOn){
        _contentTable.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table_bg"]];
    }
    else{
        _contentTable.backgroundView = nil;
    }
}

#pragma mark-- dataSource and delegate methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"ReusedCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.35];
    }
    cell.textLabel.text = items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    if(indexPath.row==0){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Swift is a new programming language"
                                                                       message:@"You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values"
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"UIAlertActionStyleDestructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        
        for(int i=0;i<10;i++){
            [alert addAction:[UIAlertAction actionWithTitle:[NSString stringWithFormat:@"button%@",@(i)]  style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [[XIAlertView alertWithTitle:[NSString stringWithFormat:@"button%@",@(i)] message:nil cancelButtonTitle:@"OK"] show];
            }]];
        }
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    else if(indexPath.row==1){
        
        XIActionSheet *actionSheet = [[XIActionSheet alloc] initWithTitle:@"Swift is a new programming language"
                                                                  message:@"You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values"
                                                        cancelButtonTitle:@"Cancel"];
        [actionSheet addButtonWithTitle:@"StyleDestructive" style:XIActionSheetButtonStyleDestructive handler:^(XIActionSheet *actionSheet, XIActionSheetButtonItem *buttonItem) {
            
        }];
        for(int i=0;i<10;i++){
            [actionSheet addDefaultStyleButtonWithTitle:[NSString stringWithFormat:@"button%@",@(i)] handler:^(XIActionSheet *actionSheet, XIActionSheetButtonItem *buttonItem) {
                [[XIAlertView alertWithTitle:[buttonItem titleForState:UIControlStateNormal] message:nil cancelButtonTitle:@"OK"] show];
            }];
        }
        [actionSheet show];
    }
    else if(indexPath.row==2){
        
        XIActionSheet *actionSheet = [[XIActionSheet alloc] initWithTitle:@"Swift is a new programming language"
                                                                  message:@""
                                                        cancelButtonTitle:@"Cancel"];
        for(int i=0;i<6;i++){
            [actionSheet addDefaultStyleButtonWithTitle:[NSString stringWithFormat:@"button%@",@(i)] handler:^(XIActionSheet *actionSheet, XIActionSheetButtonItem *buttonItem) {
                [[XIAlertView alertWithTitle:[buttonItem titleForState:UIControlStateNormal] message:nil cancelButtonTitle:@"OK"] show];
            }];
        }
        [actionSheet show];
    }
    else if(indexPath.row==3){
        
        XIActionSheet *actionSheet = [[XIActionSheet alloc] initWithTitle:@"Swift is a new programming language"
                                                                  message:@"You can define Swift enumerations to store associated values"
                                                        cancelButtonTitle:@"Cancel"];
        for(int i=0;i<12;i++){
            [actionSheet addDefaultStyleButtonWithTitle:[NSString stringWithFormat:@"button%@",@(i)] handler:^(XIActionSheet *actionSheet, XIActionSheetButtonItem *buttonItem) {
                [[XIAlertView alertWithTitle:[buttonItem titleForState:UIControlStateNormal] message:nil cancelButtonTitle:@"OK"] show];
            }];
        }
        [actionSheet show];
    }
    else if(indexPath.row==4){
        
        XIActionSheet *actionSheet = [[XIActionSheet alloc] initWithTitle:@"Swift is a new programming language"
                                                                  message:@"You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values"
                                                        cancelButtonTitle:@"Cancel"];
        [actionSheet show];
    }
    else if(indexPath.row==5){
        
        XIActionSheet *actionSheet = [[XIActionSheet alloc] initWithTitle:@"Swift is a new programming language"
                                                                  message:@"You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values.You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values.You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values.You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values.You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values,You can define Swift enumerations to store associated values"
                                                        cancelButtonTitle:@"Cancel"];
        [actionSheet show];
    }
    else if(indexPath.row==6){
        
        XIActionSheet *actionSheet = [[XIActionSheet alloc] initWithTitle:@"Swift is a new programming language"
                                                                  message:@"You can define Swift enumerations to store associated values"
                                                        cancelButtonTitle:@"Cancel"];
        actionSheet.blurEnabled = NO;
        for(int i=0;i<4;i++){
            [actionSheet addDefaultStyleButtonWithTitle:[NSString stringWithFormat:@"button%@",@(i)] handler:^(XIActionSheet *actionSheet, XIActionSheetButtonItem *buttonItem) {
                [[XIAlertView alertWithTitle:[buttonItem titleForState:UIControlStateNormal] message:nil cancelButtonTitle:@"OK"] show];
            }];
        }
        [actionSheet show];
    }
}

@end
