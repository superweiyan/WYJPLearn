//
//  WYCharAudioModel.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/17.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYCharAudioModel.h"
#import "WYJsonParser.h"
#import "WYAudioChat.h"

@interface WYCharAudioModel()
{
    NSDictionary *_charAudioDict;
}
@end

@implementation WYCharAudioModel

- (id)init
{
    self = [super init];
    if (self) {
        [self loadAudioConfig];
    }
    return self;
}

- (NSArray *)getAudioArrayByType:(WYAudioType)type
{
    if ( type == WYPhonematicType ) {
        NSArray *fiftySound = [_charAudioDict objectForKey:@"fiftySound"];
        return [self convertToWYAudioChat:fiftySound];
    }
    return nil;
}

- (void)loadAudioConfig
{
    _charAudioDict = [WYJsonParser loadLocalJson:@"WYSoundmark.json"];
}

#pragma mark private

- (NSArray *)convertToWYAudioChat:(NSArray *)typeArray
{
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithCapacity:typeArray.count];
    for (int i = 0; i < typeArray.count; i++) {
            NSArray *info = [typeArray objectAtIndex:i];
            WYAudioChat *audio = [[WYAudioChat alloc] init];
            audio.KataKanaName = [info objectAtIndex:1];
            audio.romanName = [info objectAtIndex:0];
            audio.HiraganaName = [info objectAtIndex:2];
            [newArray addObject:audio];
    }
    return newArray;
}

@end
