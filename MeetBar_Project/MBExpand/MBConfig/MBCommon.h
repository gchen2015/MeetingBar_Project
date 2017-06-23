//
//  MBCommon.h
//  MeetBar_Project
//
//  Created by L on 2017/6/22.
//  Copyright © 2017年 MB. All rights reserved.
//

#ifndef MBCommon_h
#define MBCommon_h

/*! Log */
#ifdef DEBUG
#   define MBLog(fmt, ...) NSLog(@"类名与方法名：%@（在第%@行", @(__PRETTY_FUNCTION__), @(__LINE__));
#else
#   define MBLog(...)
#endif

#define UIColorFromRGB(rgbValue)            [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define RGBColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBColorAlpha(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RANDOMCOLOR() RGBColor(rand()%256, rand()%256, rand()%256)

#define TABBAR_COLOR     UIColorFromRGB(0x3686e6)

#endif /* MBCommon_h */
