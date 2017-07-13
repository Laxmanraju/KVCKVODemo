//
//  Children.m
//  KVCKVODemo
//
//  Created by l on 7/11/17.
//  Copyright © 2017 wenova. All rights reserved.
//

#import "Children.h"

@implementation Children
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        self.siblings = [[NSMutableArray alloc] init];

    }
    return self;
}

-(NSUInteger)countOfSiblings{
    return self.siblings.count;
}

-(id)objectInSiblingsAtIndex:(NSUInteger)index{
    return [self.siblings objectAtIndex:index];
}
-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index{
    [self.siblings insertObject:object atIndex:index];
}
-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index{
    [self.siblings removeObjectAtIndex:index];
}
@end
