# NSString-select
NSString的拓展方法提取字符串中想要的信息

利用ios正则表达式和富文本将提取到的信息进行富文本的操作返回将想要的字段变成红色显眼的提示

利用字符串的拓展方法即可
调用：
NSMutableAttributedString *resultString = [NSString changeTheString:@"12321@qq.com 德萨卡 clc_cfzxyq@163.com98349845fwe ctftf:iLoveiOS@qq.com" ByRuchStringInRule:@"\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"];
    NSLog(@"%@",resultString);
