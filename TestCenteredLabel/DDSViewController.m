//
//  DDSViewController.m
//  TestCenteredLabel
//
//  Created by Gayle Dunham on 6/4/13.
//  Copyright (c) 2013 Gayle Dunham. All rights reserved.
//

#import "DDSViewController.h"
#import "DDSEditViewController.h"

@interface DDSViewController () <DDSEditViewControllerDelegate>

@end

@implementation DDSViewController

static CGFloat leftMarginImage = 20.0;
static CGFloat leftMarginText  = 47.0;
static CGFloat rightMargin     = 20.0;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self centerLabels];
}

- (void)centerLabels
{
    CGRect viewFrame = self.view.frame;
    NSArray *allLabelsAndChecks = @[ @[self.label1, self.check1], @[self.label2, self.check2], @[self.label3, self.check3] ];
    
    for (NSArray *labelAndCheck in allLabelsAndChecks) {
        UILabel     *label = labelAndCheck[0];
        UIImageView *check = labelAndCheck[1];
        
        [label sizeToFit];

        CGRect labelFrame = label.frame;
        CGRect checkFrame = check.frame;
        
        CGFloat maxWidth = viewFrame.size.width - (leftMarginText + rightMargin);

        if (labelFrame.size.width > maxWidth) {
            labelFrame.origin.x   = leftMarginText;
            labelFrame.size.width = maxWidth;
            checkFrame.origin.x = leftMarginImage;
        } else {
            CGFloat slideRight = (maxWidth - labelFrame.size.width) / 2.0;
            labelFrame.origin.x = leftMarginText + slideRight;
            checkFrame.origin.x = leftMarginImage + slideRight;
        }
        
        label.frame = labelFrame;
        check.frame = checkFrame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setCheck1:nil];
    [self setCheck2:nil];
    [self setCheck3:nil];
    [super viewDidUnload];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController *navController = segue.destinationViewController;
        
        if ([navController.topViewController isKindOfClass:[DDSEditViewController class]]) {
            DDSEditViewController *editController = (DDSEditViewController *)navController.topViewController;
            editController.delegate = self;
            editController.text1 = self.label1.text;
            editController.text2 = self.label2.text;
            editController.text3 = self.label3.text;
        }
    }
}

- (void)DDSEditViewController:(DDSEditViewController *)sender
                     setText1:(NSString *)text1
                     andText2:(NSString *)text2
                     andText3:(NSString *)text3
{    
    self.label1.text = text1;
    self.label2.text = text2;
    self.label3.text = text3;
    
    [self centerLabels];
}

@end
