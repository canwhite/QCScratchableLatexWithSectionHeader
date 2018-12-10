//
//  EnvironmentSupervisionCollectionReusableView.m
//  WitServices
//
//  Created by EricZhang on 2018/12/10.
//  Copyright © 2018年 myself. All rights reserved.
//

#import "EnvironmentSupervisionCollectionReusableView.h"

@implementation EnvironmentSupervisionCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleLabel = [UILabel new];
        [self addSubview:self.titleLabel];
        self.titleLabel.sd_layout
        .leftSpaceToView(self, 20)
        .widthIs(self.frame.size.width-40)
        .heightIs(self.frame.size.height)
        .centerYEqualToView(self);
        self.titleLabel.font= [UIFont systemFontOfSize:14];
        self.titleLabel.textColor = RGBA(103, 103, 103, 1);
        
        
        
        
    }
    return self;
    
    
    
    
    
}

@end
