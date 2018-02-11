//
//  ViewController.m
//  obj-c-sapmle
//
//  Created by 下村一将 on 2018/01/29.
//  Copyright © 2018年 kazu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

    - (NSDictionary*)dictionaryFromQueryString:(NSString *)query
    {
        if (query)
        {
            NSMutableDictionary* result = [[NSMutableDictionary alloc] init];
            NSArray* parameters = [query componentsSeparatedByString:@"&"];
            for (NSString* parameter in parameters)
            {
                if (parameter.length > 0)
                {
                    NSArray* elements = [parameter componentsSeparatedByString:@"="];
                    id key = [elements[0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    id value = (elements.count == 1 ? @YES : [elements[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]);
                    [result setObject:value forKey:key];
                }
            }
            return [result copy];
        }
        else
        {
            return nil;
        }
    }
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *string = @"1";
//    if (string.length <= 0 || [string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound) {
//        // integerではない
//        NSLog(@"NOT");
//        return;
//    }
    
    NSNumber *num = [[NSNumberFormatter new] numberFromString: @"hoge"];
    if (num) {
        NSLog(@"%@", num);
    } else {
        NSLog(@"NOT NUMBER");
    }
    
//    NSDictionary *query = [self dictionaryFromQueryString:@""];
//    NSInteger productId = [query[@"rec_id"] integerValue];
//    NSLog(@"%ld", (long)productId);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
