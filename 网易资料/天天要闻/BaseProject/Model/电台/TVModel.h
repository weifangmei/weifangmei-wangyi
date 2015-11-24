//
//  TVModel.h
//  BaseProject
//
//  Created by tarena on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class TVCListTListRadioModel;
@interface TVModel : BaseModel
@property (nonatomic,strong)NSArray *cList;
@property (nonatomic,strong)NSArray *top;
@end

@interface TVCListModel : BaseModel
@property (nonatomic, strong) NSArray *tList;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, strong) NSString *cname;

@end
@interface TVCListTListModel : BaseModel

@property (nonatomic, strong) NSString *tname;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSString *subnum;
@property (nonatomic, assign) double isHot;
@property (nonatomic, strong) NSString *tid;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) double isNew;
@property (nonatomic, strong) NSString *template1;
@property (nonatomic, assign) double recommendOrder;
@property (nonatomic, strong) NSString *alias;
@property (nonatomic, assign) double bannerOrder;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, assign) double playCount;
@property (nonatomic, strong) TVCListTListRadioModel *radio;
@property (nonatomic, strong) NSString *cid;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSString *ename;
@property (nonatomic, strong) NSString *recommend;
@property (nonatomic, assign) BOOL headLine;
@property (nonatomic, strong) NSString *topicid;
@property (nonatomic, strong) NSString *showType;
@end

@interface TVCListTListRadioModel : TVCListTListModel

@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *tAG;
@property (nonatomic, strong) NSString *url3w;
@property (nonatomic, assign) double hasHead;
@property (nonatomic, assign) double hasImg;
@property (nonatomic, strong) NSString *lmodify;

@property (nonatomic, strong) NSString *docid;
@property (nonatomic, assign) double votecount;

@property (nonatomic, strong) NSString *tAGS;

@property (nonatomic, strong) NSString *size;
@property (nonatomic, assign) double priority;

@property (nonatomic, assign) double replyCount;
@property (nonatomic, assign) double hasAD;
@property (nonatomic, strong) NSString *imgsrc;

@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *pixel;

@property (nonatomic, strong) NSString *boardid;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) NSString *digest;
@end