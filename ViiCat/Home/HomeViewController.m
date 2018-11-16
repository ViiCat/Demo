//
//  HomeViewController.m
//  ViiCat
//
//  Created by Liu Jie on 2018/11/15.
//  Copyright © 2018 JasonMark. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation HomeViewController
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"HomeViewController DidAppear");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HomeTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
}

#pragma mark - LazyLoad
- (NSArray *)dataSource {
    if (!_dataSource) {
        NSMutableArray *groupsArr = [[NSMutableArray alloc] init];
        
        [groupsArr addObject:@{@"UserInterface": @[@{@"Visual Effects":@"VisualBlurEffectViewController"},@{@"Text,Shapes,Gradients":@"CAShapeLayerViewController"}]}];
        
//        [groupsArr addObject:@{@"Animation": @[@{@"UIVisualEffectView":@"class"},@{@"UIVisualEffectView":@"class"}]}];
        _dataSource = groupsArr;
    }
    return _dataSource;
}

#pragma mark - TableDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *dicGroupData = self.dataSource[section];
    NSString *strGroupName = dicGroupData.allKeys.firstObject;
    return strGroupName;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dicGroup = self.dataSource[section];
    NSArray *list = dicGroup.allValues.firstObject;
    
    return list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *dicGroupData = self.dataSource[indexPath.section];
    NSString *strGroupName = dicGroupData.allKeys.firstObject;
    NSArray *listData = dicGroupData.allValues.firstObject;
    NSDictionary *dicCell = listData[indexPath.row];
    cell.strTitle = dicCell.allKeys.firstObject;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSDictionary *dicGroupData = self.dataSource[indexPath.section];
    NSString *strGroupName = dicGroupData.allKeys.firstObject;
    NSArray *listData = dicGroupData.allValues.firstObject;
    NSDictionary *dicCell = listData[indexPath.row];
    
    UIViewController *vc = [[NSClassFromString(dicCell.allValues.firstObject) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    FooterView *view = [[NSBundle mainBundle] loadNibNamed:@"FooterView" owner:self options:nil].firstObject;
//
//    CGFloat fTotal = 0;
//    for (ItemModel *itemModel in self.arr) {
//        fTotal += itemModel.numbPrice.floatValue;
//    }
//    view.lbTotal.text = [NSString stringWithFormat:@"%f元", fTotal];
//    return view;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
