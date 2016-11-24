//
//  Children.h
//  KVOTest
//
//  Created by dang huu duong on 10/21/16.
//  Copyright © 2016 dang huu duong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Children : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic) NSUInteger age;

@property (nonatomic, strong) NSMutableArray *siblings;

@property void *someContext;

- (instancetype)initWithName: (NSString*) name withAge: (NSUInteger) age;

- (NSUInteger)countOfSiblings;
- (id)objectInSiblingsAtIndex:(NSUInteger)index;
- (void)insertSiblings:(NSArray *)array atIndexes:(NSUInteger)indexes;
- (void)insertObject:(NSString *)object inSiblingsAtIndex:(NSUInteger)index;
- (void)removeObjectFromSiblingsAtIndex:(NSUInteger)index;


@end
