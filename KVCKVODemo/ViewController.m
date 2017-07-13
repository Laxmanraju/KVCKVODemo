//
//  ViewController.m
//  KVCKVODemo
//
//  Created by l on 7/11/17.
//  Copyright © 2017 wenova. All rights reserved.
//

#import "ViewController.h"
#import "Children.h"

@interface ViewController ()
@property (nonatomic, strong) Children *child1;

@property (nonatomic, strong) Children *child2;

@property (nonatomic, strong) Children *child3;
@end

// conext is pointer that points to itself
static void *child1Context = &child1Context;
static void *child2Context = &child2Context;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
        self.child1 = [[Children alloc] init];
//        self.child1.name  = @"George";
//        self.child1.age=  19;
//
    
    [self.child1 setValue:@"George" forKey:@"name"];
    [self.child1 setValue:[NSNumber numberWithInteger:15] forKey:@"age"];
    
    NSString *childName =  [self.child1 valueForKey:@"name"];
    NSString *childAge = [self.child1 valueForKey:@"age"];
        NSLog(@"%@ %@", childName, childAge);
    
    [self.child1 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:child1Context];
    [self.child1 addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:child1Context];
 
    
}


-(void)viewDidAppear:(BOOL)animated{

  
    [self.child1 setValue:@"Laxman" forKey:@"name"];
    
    
    [self.child1 willChangeValueForKey:@"name"];
    self.child1.name = @"Michael";
    [self.child1 didChangeValueForKey:@"name"];

    
    
    self.child2   = [[Children alloc] init];
    [self.child2 setValue:@"carmen" forKey:@"name"];

    //context is used to know who made the change call for observer
     [self.child2 addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:child2Context];
    
    [self.child2 setValue:@"camren" forKey:@"name"];
    
    
    
    /// KVC KVO for arrays
    [self.child1 addObserver:self forKeyPath:@"siblings" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    [self.child1 insertObject:@"Alex" inSiblingsAtIndex:0];
    [self.child1 insertObject:@"HAnk" inSiblingsAtIndex:1];
    [self.child1 removeObjectFromSiblingsAtIndex:0];
    


}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
    if (context == child1Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the child1 was changed.");
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child1 was changed.");
            NSLog(@"%@", change);
        }
    }
    
    if (context == child2Context) {
        if ([keyPath isEqualToString:@"name"]) {
            NSLog(@"The name of the child2 was changed.");
            NSLog(@"%@", change);
        }
        
        if ([keyPath isEqualToString:@"age"]) {
            NSLog(@"The age of the child 2was changed.");
            NSLog(@"%@", change);
        }
    }
    else{
        if ([keyPath isEqualToString:@"siblings"]) {
            NSLog(@"%@", change);

        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
