//
//  Children.h
//  KVCKVODemo
//
//  Created by l on 7/11/17.
//  Copyright © 2017 wenova. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Children : NSObject
@property (nonatomic, strong)NSString *name;
@property (nonatomic) NSUInteger age;
@property (nonatomic, strong) NSMutableArray *siblings;

-(id)objectInSiblingsAtIndex:(NSUInteger)index;
-(void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index;
-(void)removeObjectFromSiblingsAtIndex:(NSUInteger)index;
@end
