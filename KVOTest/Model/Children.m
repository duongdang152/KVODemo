//
//  Children.m
//  KVOTest
//
//  Created by dang huu duong on 10/21/16.
//  Copyright © 2016 dang huu duong. All rights reserved.
//

#import "Children.h"

@implementation Children

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = @"";
        self.age = 0;
        self.someContext = &_someContext;
        self.siblings = [[NSMutableArray alloc] init];
    }
    return self;
}

- (instancetype)initWithName: (NSString*) name withAge: (NSUInteger) age {
    self = [super init];
    if (self) {
        self.name = name;
        self.age = age;
    }
    return self;
}

+(BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    else{
        return [super automaticallyNotifiesObserversForKey:key];
    }
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
