//
//  BTTableViewController.h
//  BlocTalk
//
//  Created by Man Hong Lee on 11/18/15.
//  Copyright (c) 2015 ManHong Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UISwitch *swVisible;

- (IBAction)toggleVisibility:(id)sender;
- (IBAction)refresh:(id)sender;

@end
