//
//  ViewController.m
//  OpenGLES_Ch03
//
//  Created by 于军振 on 2020/1/22.
//  Copyright © 2020 于军振. All rights reserved.
//

#import "ViewController.h"
#import "Ch03_01_Controller.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor  = [UIColor whiteColor];
    [self initTableView];
}
- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];

    [self.view addSubview:self.tableView];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    self.dataArray = [NSMutableArray arrayWithObjects:@"01",@"动画",@"图片选择器",@"集合布局",@"视频录制编码",@"视频录制解码",@"自定义相机",@"美颜相机",@"asset",@"touchID",@"健康数据",@"二维码扫描",@"腾讯二维码识别",@"播放全屏示例",@"图片合成实例",@"多线程下载",@"签到", @"字幕解析",@"视频编辑",@"面试题总结测试",@"分享",@"滑动效果",@"opengl",nil];

    [self.tableView reloadData];
   
}
#pragma mark tableViewDelegate and tableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identfier = @"identfier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identfier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identfier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 1:
            {
                Ch03_01_Controller *vc = [[Ch03_01_Controller alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            break;
            
        default:
            break;
    }
}
@end
