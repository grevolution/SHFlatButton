//
//  ViewController.m
//  SHFlatButton
//
//  Created by SHAN UL HAQ on 7/31/14.
//  Copyright (c) 2014 com.grevolution.shflatbutton. All rights reserved.
//

#import "ViewController.h"
#import "SHFlatButton.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SHFlatButton *btnOne;
@property (weak, nonatomic) IBOutlet SHFlatButton *btnTwo;
@property (weak, nonatomic) IBOutlet SHFlatButton *btnThree;
@property (weak, nonatomic) IBOutlet SHFlatButton *btnFour;
@property (weak, nonatomic) IBOutlet SHFlatButton *btnDisabled;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _btnDisabled.enabled = NO;
    
    _btnOne.buttonColor = UIColorFromRGB(0x1ABC9C);
    _btnOne.shadowColor = UIColorFromRGB(0x16A085);

    _btnTwo.buttonColor = UIColorFromRGB(0x3498DB);
    _btnTwo.shadowColor = UIColorFromRGB(0x2980B9);

    _btnThree.buttonColor = UIColorFromRGB(0xE67E22);
    _btnThree.shadowColor = UIColorFromRGB(0xD35400);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
