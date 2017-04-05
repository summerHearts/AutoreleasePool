//
//  main.m
//  AutoreleasePool
//
//  Created by Kenvin on 2017/4/5.
//  Copyright © 2017年 Kenvin. All rights reserved.
//

#import <Foundation/Foundation.h>

// 生成两个全局weak变量用来观察实验对象
__weak NSString *weak_String;
__weak NSString *weak_StringAutorelease;


void createString(void) {
    
    NSString *string = [[NSString alloc] initWithFormat:@"Hello, World!"];    // 创建常规对象
    NSString *stringAutorelease = [NSString stringWithFormat:@"Hello, World! Autorelease"]; // 创建autorelease对象
    
    weak_String = string;
    weak_StringAutorelease = stringAutorelease;
    NSLog(@"------in the createString()------");
    NSLog(@"%@", weak_String);
    NSLog(@"%@\n\n", weak_StringAutorelease);
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        createString();
        NSLog(@"------in the autoreleasepool------");
        NSLog(@"%@", weak_String); // 常规对象已经被释放  autorelease对象被延迟释放
        NSLog(@"%@\n\n", weak_StringAutorelease);
    }
    
    NSLog(@"------in the main()------");
    NSLog(@"%@", weak_String);
    NSLog(@"%@", weak_StringAutorelease);
    return 0;
}
