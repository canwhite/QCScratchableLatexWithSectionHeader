//
//  EnvironmentSupervisionCollectionViewCell.m
//  WitServices
//
//  Created by EricZhang on 2018/12/10.
//  Copyright © 2018年 myself. All rights reserved.
//

#import "EnvironmentSupervisionCollectionViewCell.h"

@implementation EnvironmentSupervisionCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        
        CGFloat width = self.frame.size.width;
        self.layer.cornerRadius = 5;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 0.5;
        self.layer.borderColor = RGBA(242, 242, 242, 1).CGColor;
        
        
        //图片
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        self.imgView.sd_layout
        .centerXEqualToView(self)
        .centerYEqualToView(self).offset(-12)
        .widthIs(56)
        .heightIs(56);
        
        
        //label
        self.label = [UILabel new];
        [self addSubview:self.label];
        self.label.sd_layout
        .centerXEqualToView(self)
        .topSpaceToView(self.imgView, 10)
        .widthIs(width)
        .heightIs(13);
        self.label.font = [UIFont systemFontOfSize:13];
        self.label.textAlignment = NSTextAlignmentCenter;
        
        
    }
    return self;
}
@end

