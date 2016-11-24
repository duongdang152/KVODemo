//
//  ViewController.m
//  KVOTest
//
//  Created by dang huu duong on 10/21/16.
//  Copyright © 2016 dang huu duong. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"

@interface ViewController ()

@property (nonatomic, strong) Children *child1;

@property (nonatomic, strong) Children *child2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.child1 = [Children new];
    self.child1.name = @"Duong";
    self.child1.age = 30;
    self.child2 = [Children new];
    self.child2.name = @"Child2";
    self.child2.age = 50;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.child1 addObserver:self
            forKeyPath:@"age"
               options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
               context:self.child1.someContext];
    [self.child1 addObserver:self
                  forKeyPath:@"name"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:self.child1.someContext];
    [self.child1 addObserver:self
                  forKeyPath:@"siblings"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:self.child1.someContext];
    [self.child2 addObserver:self
                  forKeyPath:@"age"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:self.child2.someContext];
    [self.child2 addObserver:self
                  forKeyPath:@"name"
                     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                     context:self.child2.someContext];
}

-(void)viewDidAppear:(BOOL)animated {
    [self.child1 setValue:@20 forKey:@"age"];
//    [self.child1 setValue:@"Huu Duong" forKey:@"name"];
    
    [self.child1 willChangeValueForKey:@"name"];
    [self.child1 setValue:@"Huu Duong" forKey:@"name"];
    self.child1.name = @"Michael1";
    self.child1.name = @"Michael2";
    [self.child1 setValue:@4 forKey:@"age"];
    [self.child1 didChangeValueForKey:@"name"];
    
    
    [self.child1 insertObject:@"Nguyen A" inSiblingsAtIndex:0];
    [self.child1 insertObject:@"Nguyen B" inSiblingsAtIndex:1];
    [self.child1 insertObject:@"Nguyen C" inSiblingsAtIndex:2];
    [self.child1 removeObjectFromSiblingsAtIndex:1];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
//    if (context == self.child1.someContext) {
//        if ([keyPath isEqualToString:@"age"]) {
//            NSLog(@"The age of the child 1 was changed.");
//            NSLog(@"%@", change);
//        }
//    }
//    else if (context == self.child2.someContext) {
//        if ([keyPath isEqualToString:@"age"]) {
//            NSLog(@"The age of the child 2 was changed.");
//            NSLog(@"%@", change);
//        }
//    }
//    else {
//        NSLog(@"UNKNOW");
//    }
    
    if (object == self.child1) {
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child 1 was changed.");
            NSLog(@"%@", change);
        }
        else if ([keyPath isEqualToString:@"name"]) {
            if ([keyPath isEqualToString:@"name"]) {
                NSLog(@"The name of the child 1 was changed.");
                NSLog(@"%@", change);
            }
        }
        else{
            if ([keyPath isEqualToString:@"siblings"]) {
                NSLog(@"%@", change);
            }
        }
    }
    else if (object == self.child2) {
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child 2 was changed.");
            NSLog(@"%@", change);
        }
    }
    else {
        NSLog(@"UNKNOW");
    }

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
