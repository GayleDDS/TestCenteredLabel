//
//  DDSEditViewController.h
//  TestCenteredLabel
//
//  Created by Gayle Dunham on 6/4/13.
//  Copyright (c) 2013 Gayle Dunham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDSEditViewController;

@protocol DDSEditViewControllerDelegate <NSObject>
- (void)DDSEditViewController:(DDSEditViewController *)sender
                     setText1:(NSString *)text1
                     andText2:(NSString *)text2
                     andText3:(NSString *)text3;

@end

@interface DDSEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UITextField *textField3;

@property (strong, nonatomic) NSString *text1;
@property (strong, nonatomic) NSString *text2;
@property (strong, nonatomic) NSString *text3;

@property (strong, nonatomic) id<DDSEditViewControllerDelegate> delegate;

@end
