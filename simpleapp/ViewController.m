//
//  ViewController.m
//  simpleapp
//
//  Created by Igor Maia Romcy on 15/05/19.
//  Copyright © 2019 igorromcy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextView;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextView;

@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.username = @"igor";
    self.password = @"securepw";
    
    self.passwordTextView.secureTextEntry = YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)onLoginPressed:(id)sender {
    
    BOOL isUserEqual = [self.username isEqualToString:[self.usernameTextView text]];
    BOOL isPasswordEqual = [self.password isEqualToString:[self.passwordTextView text]];
    
    if (isUserEqual && isPasswordEqual)
    {
        NSLog(@"SUCCESS!");
        [self.notificationLabel setText:@"Congratulations you have logged in!"];
    }
    else
    {
        NSLog(@"FAILURE!");
        [self.notificationLabel setText:@"Your username or password was incorrect."];
    }
}
@end

