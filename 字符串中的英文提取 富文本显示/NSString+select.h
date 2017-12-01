//
//  NSString+select.h
//  字符串中的英文提取 富文本显示
//
//  Created by kys-20 on 2017/11/28.
//  Copyright © 2017年 kys-20. All rights reserved.
//自顶向下

#import <Foundation/Foundation.h>
//在这个里面调用富文本需要加上这个头文件 不然访问不了
#import <Photos/Photos.h>
@interface NSString (select)


/**
 筛选字符串中的邮箱

 @param string 传入字符串
 @return 返回邮箱数组
 */
+(NSArray *)selectTheEmailOfString : (NSString *)string;

/**
 根据传入的规则筛选字符串

 @param string 传入的字符串
 @param rule 规则
 @return 返回符合规则的字符串
 */
+(NSString *)selseTheStringFromString : (NSString *)string inRule: (NSString *)rule;


/**
 根据传入的规则筛选字符串 返回数组（包含符合的字符串）

 @param string 传入的string
 @param rule 规则
 @return 返回数组
 */
+(NSArray *)selseTheStringFromStringAndReturnString : (NSString *)string andRule : (NSString *)rule;


/**
 根据传入的正则表达式和字符串 提取符合正则的字符变成红色的富文本返回的对应的富文本

 @param string 出入的字符串
 @param rule 规则
 @return 返回的富文本
 */
+(NSMutableAttributedString *)changeTheString : (NSString *)string ByRuchStringInRule : (NSString *)rule;

/**
 根据传入的正则字符串生成对应的法则

 @param string 传入的正则字符串
 @return 返回正则对象
 */
+(NSRegularExpression *)ruleOfString : (NSString *)string;



/**
  私有的方法 根据传入的颜色和总共的字 和要改变的字的数组改变总共的文字并返回相应的富文本

 @param color 传入的颜色
 @param string 传入整体的文字
 @param subArray 传入要更改的文字的数组
 @return 返回整体带有富文本的文字
 */
+(NSMutableAttributedString *)lsh_changeColorWithColor : (UIColor *)color AllString : (NSString *)string SubStringArray : (NSArray *)subArray;

@end
