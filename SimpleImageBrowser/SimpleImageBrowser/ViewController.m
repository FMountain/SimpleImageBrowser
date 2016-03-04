//
//  ViewController.m
//  SimpleImageBrowser
//
//  Created by mac on 16/3/4.
//  Copyright © 2016年 A3. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *topLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic,assign)int index; //索引

@property (nonatomic,strong)NSArray *imageDicts;
@end

@implementation ViewController

#pragma mark - 懒加载plist文件
- (NSArray *)imageDicts
{
    if (!_imageDicts) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"imageDesc.plist" ofType:nil];
        _imageDicts = [NSArray arrayWithContentsOfFile:path];
    }
    return  _imageDicts;
}
- (IBAction)leftBtn:(UIButton *)sender {
    self.index --;
    [self btnClickChange];
}
- (IBAction)rightBtn:(UIButton *)sender {
    self.index ++;
    [self btnClickChange];
}

- (void)btnClickChange
{
    self.topLabel.text = [NSString stringWithFormat:@"%d/%d",
                          (self.index + 1),self.imageDicts.count];
    
    self.descLabel.text = self.imageDicts[self.index][@"description"];
    
    self.imageView.image = [UIImage imageNamed:self.imageDicts[self.index][@"name"]];
    
    self.leftBtn.enabled = (self.index != 0);
    
    //只要不是最后一张图片都能点击
    self.rightBtn.enabled = (self.index != self.imageDicts.count - 1);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
