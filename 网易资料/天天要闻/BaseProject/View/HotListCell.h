//
//  HotListCell.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotListCell : UITableViewCell
//* 左侧图片 */
@property(nonatomic,strong)TRImageView *iconIV;
//* 题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
//* 来源标签 */
@property(nonatomic,strong)UILabel *sourceLb;
/** 不喜欢的button*/
@property (nonatomic,strong)FUIButton *btn;
@end
