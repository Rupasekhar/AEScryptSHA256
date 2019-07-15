//
//  ViewController.m
//  AEScryptSHA256
//
//  Created by Apple on 19/06/19.
//  Copyright © 2019 Karvy. All rights reserved.
//

#import "ViewController.h"
#import "AESCrypt.h"


@interface ViewController ()
{
    
    __weak IBOutlet UITextView *txtView_Crypted;
    __weak IBOutlet UITextField *txtFld_crypt;
    NSString *encryptedStr;
    NSString *decryptedStr;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)dismissKeyboard
{
    [txtFld_crypt resignFirstResponder];
}
- (IBAction)btn_ActionEncrypt:(id)sender
{
    encryptedStr = [AESCrypt encrypt:txtFld_crypt.text password:@"rk"];
    txtView_Crypted.text = encryptedStr;
    
}
- (IBAction)btn_ActionDecrypt:(id)sender
{
    decryptedStr = [AESCrypt decrypt:encryptedStr password:@"rk"];
    txtView_Crypted.text = decryptedStr;

}

@end
