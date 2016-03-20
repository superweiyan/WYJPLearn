//
//  WYMarco.h
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#ifndef WYMarco_h
#define WYMarco_h

#define WYWeakSelf __weak typeof(self) weakSelf = self;

#define safeCallblock(block, ...) if((block)) { block(__VA_ARGS__); }

#endif /* WYMarco_h */
