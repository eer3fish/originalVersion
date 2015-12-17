//
//  DictionaryViewController.m
//  originalVersion
//
//  Created by fish on 15/12/11.
//  Copyright © 2015年 fish. All rights reserved.
//

#import "DictionaryViewController.h"
#import "DictionaryTableView.h"
#import "DictionaryTableViewCell.h"

@interface DictionaryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong )DictionaryTableView *tableView;
@end

@implementation DictionaryViewController

- (instancetype)init {
    self = [super init];
    _tableView = [DictionaryTableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView.frame = self.view.bounds;
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"Dictionary";
    DictionaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[DictionaryTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld",(long)indexPath.row);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end
