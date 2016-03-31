//
//  WYTrainingEngine.m
//  WYJPLearn
//
//  Created by weiyan on 16/3/23.
//  Copyright © 2016年 LWY. All rights reserved.
//

#import "WYTrainingEngine.h"
#import "WYJsonParser.h"
#import "WYContentParse.h"
#import "WYTrainingType.h"
#import <objc/runtime.h>

@interface WYTrainingEngine()
{
    NSArray *_currentContentArray;
}
@end

@implementation WYTrainingEngine

- (id)init
{
    self = [super init];
    if (self) {
        [self initExample];
    }
    return self;
}

- (void)initExample
{
    NSString *path = [[[[NSBundle mainBundle] resourcePath] stringByAppendingString:@"/"] stringByAppendingString:@"WYAudioTraning.json"];
    
    [self loadLearnConfigFile:path];
}

- (void)loadLearnConfigFile:(NSString *)filePath
{
    NSFileManager *manager = [NSFileManager defaultManager];
    BOOL isFileExist = [manager fileExistsAtPath:filePath];
    if (isFileExist) {
        NSString *fileName = [manager displayNameAtPath:filePath];
        NSDictionary *fileContent = [WYJsonParser loadLocalJson:fileName];
        [self dispatchParse:fileContent];
    }
}

- (void)dispatchParse:(NSDictionary *)info
{
    NSNumber *type = [info objectForKey:@"TypeKey"];
    switch (type.longLongValue) {
        case 1:
        {
            NSArray *itemArray = [info objectForKey:@"Content"];
            _currentContentArray = [WYContentParse parseTypeForThree:itemArray];
        }
            break;
            
        default:
            break;
    }
}

- (WYTraningQuestion *)generateQuestion:(WYTraningParserType *)parseType
                            paramOption:(NSUInteger)option
{
    if (WYTraningParserAudioType == parseType) {
        return [self createQuestion:option];
    }
    return nil;
}

- (WYTraningQuestion *)createQuestion:(NSUInteger)paramOption
{
    NSUInteger keyIndex = arc4random() % _currentContentArray.count;
    WYTrainingItemWithThree *itemInfo = [_currentContentArray objectAtIndex:keyIndex];
    
    WYTraningQuestion *question = [[WYTraningQuestion alloc] init];
    
    // 0 是用来做发音遍历
    if (paramOption == 0) {
        paramOption = 1;
    }

    unsigned count;
    objc_property_t *properties = class_copyPropertyList([WYTrainingItemWithThree class], &count);
    
    NSMutableArray *valueArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        NSString *value = [itemInfo valueForKey:name];
        [valueArray addObject:value];
    }

    NSString *questionString = [valueArray objectAtIndex:paramOption];
    question.fakeAnswerOne = [self createFakeAnswer:keyIndex optionIndex:paramOption];
    question.fakeAnswerTwo = [self createFakeAnswer:keyIndex optionIndex:paramOption];
    
    paramOption = (paramOption == 1 ? 2 : 1);
    NSString *answerString = [valueArray objectAtIndex:paramOption];
    question.question = questionString;
    question.answer = answerString;
    return question;
}

- (NSString *)createFakeAnswer:(NSUInteger)answerKey optionIndex:(NSUInteger)optionIndex
{
    NSUInteger fakeIndex = arc4random() % _currentContentArray.count;
    while (answerKey == fakeIndex) {
        fakeIndex = arc4random() % _currentContentArray.count;
    }
    
    WYTrainingItemWithThree *itemInfo = [_currentContentArray objectAtIndex:fakeIndex];
    
    NSString *propertyName = [self getProperty:itemInfo propertyIndex:optionIndex];
    return propertyName;
}

- (NSString *)getProperty:(id)object propertyIndex:(NSUInteger)propertyIndex
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([WYTrainingItemWithThree class], &count);
    if (propertyIndex < count) {
        objc_property_t property = properties[propertyIndex];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        NSString *value = [object valueForKey:name];
        return value;
    }
    return nil;
}

@end
