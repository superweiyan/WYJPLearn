//
//  WYAudioPlayUtils.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/21.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYAudioPlayUtils.h"
#import <AVFoundation/AVFoundation.h>

@interface WYAudioPlayUtils()<AVAudioPlayerDelegate>
{
    AVAudioPlayer *_audioPlayer;
}
@end

@implementation WYAudioPlayUtils

- (void)startPlay
{

}

- (void)playLocalRresouce:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"wav"];
    if (path.length == 0) {
        return ;
    }
    NSURL *url = [NSURL fileURLWithPath:path];

    _audioPlayer = nil;
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    _audioPlayer.delegate = self;
    [_audioPlayer play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if (flag) {
        player = nil;
    }
}

@end
