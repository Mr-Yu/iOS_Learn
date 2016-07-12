//
//  ViewController.m
//  KeychainTest
//
//  Created by wapage-mac on 16/7/11.
//  Copyright © 2016年 wapage-mac. All rights reserved.
//

#import "ViewController.h"
#import "WelcomeViewController.h"
#import "SecretDataManager.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *UserName;
@property (weak, nonatomic) IBOutlet UITextField *PassWord;
- (IBAction)login:(id)sender;
- (IBAction)clearData:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.PassWord.text = [SecretDataManager readPassWord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(id)sender {
    [SecretDataManager savePassWord:self.PassWord.text];
    [self.view endEditing:YES];
    if ([self.UserName.text isEqualToString:@"admin"] && [self.PassWord.text isEqualToString:@"admin"]) {
        UIStoryboard *stroyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        WelcomeViewController *vc = [stroyBoard instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"用户名或者密码错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)clearData:(id)sender {
    [SecretDataManager deletePassWord];
}
@end
