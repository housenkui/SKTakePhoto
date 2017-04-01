//
//  ViewController.m
//  SKTakePhoto
//
//  Created by Code_Hou on 2017/4/1.
//  Copyright © 2017年 侯森魁. All rights reserved.
//

#import "ViewController.h"
#import "takePhoto.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *headBtn;

@end

@implementation ViewController

- (IBAction)headerBtn:(UIButton *)sender {
    
    
    [takePhoto sharePicture:^(UIImage *HeadImage){
        
        [self.headBtn setBackgroundImage:HeadImage forState:UIControlStateNormal];
        
    }];
    
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
