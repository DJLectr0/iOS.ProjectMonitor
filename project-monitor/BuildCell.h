//
//  BuildCell.h
//  project-monitor
//
//  Created by Dimitri Roche on 2/11/14.
//  Copyright (c) 2014 Dimitri Roche. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Build.h"

@interface BuildCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *projectLabel;
@property (weak, nonatomic) IBOutlet UILabel *branchLabel;
@property (weak, nonatomic) IBOutlet UIImageView *statusImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)setFromBuild:(Build*)build;

@end
