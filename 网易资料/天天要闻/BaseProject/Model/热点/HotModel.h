//
//  HotModel.h
//  BaseProject
//
//  Created by tarena on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface HotModel : BaseModel
@property (nonatomic,strong)NSArray *recomment;
@end

@interface HotRecommentModel : BaseModel

@property (nonatomic, strong) NSString *ptime;//
@property (nonatomic, assign) double downTimes;//
@property (nonatomic, strong) NSString *source;//来源
@property (nonatomic, strong) NSString *title;//标题
@property (nonatomic, assign) double imgType;//
@property (nonatomic, strong) NSString *img;//
@property (nonatomic, assign) double picCount;//
@property (nonatomic, assign) double hasHead;
@property (nonatomic, strong) NSString *photosetID;//
@property (nonatomic, strong) NSArray *unlikeReason;//ytt
@property (nonatomic, strong) NSString *imgsrc;//
@property (nonatomic, strong) NSString *docid;//
@property (nonatomic, assign) double replyCount;//
@property (nonatomic, strong) NSString *prompt;
@property (nonatomic, assign) double clkNum;//
@property (nonatomic, assign) double hasAD;
@property (nonatomic, strong) NSString *tag;//
@property (nonatomic, strong) NSString *skipType;//
@property (nonatomic, assign) double upTimes;//
@property (nonatomic, strong) NSString *internalBaseClass1Identifier;
@property (nonatomic, strong) NSString *interest;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *replyid;//
@property (nonatomic, strong) NSString *program;//
@property (nonatomic, assign) double recType;//
@property (nonatomic, strong) NSArray *imgnewextra;////jkkikkk
@property (nonatomic, strong) NSString *skipID;//
@property (nonatomic, strong) NSString *recReason;
@property (nonatomic, strong) NSString *digest;//
@property (nonatomic, strong) NSString *ID;//根据id值获取详情

@end
@interface HotRecommentImgnewextraModel : BaseModel
@property (nonatomic, strong) NSString *imgsrc;
@end
