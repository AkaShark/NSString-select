//
//  NSString+select.m
//  字符串中的英文提取 富文本显示
//
//  Created by kys-20 on 2017/11/28.
//  Copyright © 2017年 kys-20. All rights reserved.
//


#import "NSString+select.h"
#pragma mark =====其中的一个过程循环取出range的那块 感觉可以写一个不暴露的方法 类内部调用去 再想想怎么写 =====
@implementation NSString (select)

#pragma mark =====最基础的四个方法 =====
//生成正则对象
+ (NSRegularExpression *)ruleOfString:(NSString *)string
{
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:string options:0 error:&error];
    return regex;
}
//返回符合规则的字符串的数组
+(NSArray *)selseTheStringFromStringAndReturnString : (NSString *)string andRule : (NSString *)rule
{
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    NSRegularExpression *regex = [self ruleOfString:rule];
    if (regex != nil)
    {
        //用该方法解析出所有
        NSArray* array = [regex matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, [string length])];
        
        //当解析出的数组至少有一个对象时，即原文本中存在至少一个符合规则的字段
        if (array.count != 0) {
            for (NSTextCheckingResult* result in array) {
                NSRange range = result.range;
                [resultArray addObject:[string substringWithRange:range]];
            }
        }
    }
    return (NSArray *)resultArray;
}
//拼接符合规则的字符串
+ (NSString *)selseTheStringFromString:(NSString *)string inRule:(NSString *)rule
{
    
    NSRegularExpression *regex = [self ruleOfString:rule];
    NSMutableString* stringArray = [[NSMutableString alloc] init];
    //也可以提出来写一个对象方法（或者类方法） 不暴露出去
    if (regex != nil)
    {
        //用该方法解析出所有
        NSArray* array = [regex matchesInString:string options:NSMatchingReportProgress range:NSMakeRange(0, [string length])];
        
        //当解析出的数组至少有一个对象时，即原文本中存在至少一个符合规则的字段
        if (array.count != 0) {
            for (NSTextCheckingResult* result in array) {
                
                //从NSTextCheckingResult类中取出range属性
                NSRange range = result.range;
                [stringArray appendString:[string substringWithRange:range]];
            }
        }
    }
    return (NSString *)stringArray;
}
//私有方法
+(NSMutableAttributedString *)lsh_changeColorWithColor : (UIColor *)color AllString : (NSString *)string SubStringArray : (NSArray *)subArray
{
    NSMutableAttributedString *resultString =[[NSMutableAttributedString alloc] initWithString:string];
    for (NSString *rangeString in subArray)
    {
        NSRange range = [string rangeOfString:rangeString options:NSBackwardsSearch];
        [resultString addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
    return resultString;
}
#pragma mark =====再次调用 =====
//邮箱
+ (NSArray *)selectTheEmailOfString:(NSString *)string
{
     NSString* regexString = @"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:[self selseTheStringFromString:string inRule:regexString]];
    
    return (NSArray *)array;
}
//将传入的字符变成富文本提取其中想要的信息
+ (NSMutableAttributedString *)changeTheString:(NSString *)string ByRuchStringInRule:(NSString *)rule
{
    NSArray *tempArray = [self selseTheStringFromStringAndReturnString:string andRule:rule];
    return [self lsh_changeColorWithColor:[UIColor redColor] AllString:string SubStringArray:tempArray];
}


@end
