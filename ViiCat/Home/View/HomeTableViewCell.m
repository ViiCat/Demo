//
//  HomeTableViewCell.m
//  ViiCat
//
//  Created by Liu Jie on 2018/11/15.
//  Copyright © 2018 JasonMark. All rights reserved.
//

#import "HomeTableViewCell.h"
@interface HomeTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;

@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setStrTitle:(NSString *)strTitle {
    _strTitle = strTitle;
    self.lbTitle.text = strTitle;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
