//
//  DDSEditViewController.m
//  TestCenteredLabel
//
//  Created by Gayle Dunham on 6/4/13.
//  Copyright (c) 2013 Gayle Dunham. All rights reserved.
//

#import "DDSEditViewController.h"

@interface DDSEditViewController ()

- (IBAction)saveAction:(UIBarButtonItem *)sender;
- (IBAction)cancelAction:(UIBarButtonItem *)sender;

@end

@implementation DDSEditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.textField1.text = self.text1;
    self.textField2.text = self.text2;
    self.textField3.text = self.text3;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setText1:nil];
    [self setText2:nil];
    [self setText3:nil];
    
    [self setTextField1:nil];
    [self setTextField2:nil];
    [self setTextField3:nil];
    [super viewDidUnload];
}

- (IBAction)saveAction:(UIBarButtonItem *)sender;
{
    [self.delegate DDSEditViewController:self
                                setText1:self.textField1.text
                                andText2:self.textField2.text
                                andText3:self.textField3.text];
    
    [[self presentingViewController] dismissModalViewControllerAnimated:YES];
}

- (IBAction)cancelAction:(UIBarButtonItem *)sender
{
    [[self presentingViewController] dismissModalViewControllerAnimated:YES];
}

@end
