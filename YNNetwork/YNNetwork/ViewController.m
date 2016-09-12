//
//  ViewController.m
//  YNNetwork
//
//  Created by wapage-mac on 16/9/7.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import "ViewController.h"
#import "HttpTest.h"
#import "HttpBase.h"
#import "HttpManager.h"
#import "MBProgressHUD.h"

@interface ViewController (){
    MBProgressHUD *HUD;
    NSMutableArray *_request;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[HttpManager sharedManager] setBaseUrl];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"网络请求" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn.layer setBorderWidth:1.0];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}

- (void)btnClick:(NSNotification *)click{
    HttpTest *httptest = [[HttpTest alloc] initWithMobile:@"12345678901"];;
    [self postForRequest:httptest callback:^(NSObject * _Nonnull rsponse) {
        //执行失败
        [self showAlert:[(HttpBase*)rsponse msg] handler:^(UIAlertAction * _Nullable action) {
            NSLog(@"请求成功");
        }];
    }];

}

//Http Post请求
-(void)postForRequest:(id __nonnull)request callback:(Callback __nonnull)callback{
    [self showHUD];
    [_request addObject:request];
    [[HttpManager sharedManager] postForRequest:request callback:^(NSObject *rsponse, BOOL isSuccess) {
        if (!isSuccess){
            [self hideHUD];
            NSLog(@"请求失败");
            return ;
        }
        
        if ([[(HttpBase*)request code] intValue] == 0){
            NSLog(@"执行回调");
            callback(rsponse);
        }else{
            //执行失败
            NSLog(@"%@",[(HttpBase*)rsponse msg]);
        }
        
        if ([_request indexOfObject:request] != NSNotFound)
            [_request removeObject:request];
        
        [self hideHUD];
    }];
}

//HUD
-(void)showHUD{
    if (HUD == nil){
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        HUD.labelText = @"正在加载";
        [self.view addSubview:HUD];
    }
    [HUD show:YES];
}

-(void)hideHUD{
    [HUD hide:YES];
}

- (void)showAlert:(NSString* __nonnull)message handler:(void (^ __nullable)(UIAlertAction *__nullable action ))handler{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:handler];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
