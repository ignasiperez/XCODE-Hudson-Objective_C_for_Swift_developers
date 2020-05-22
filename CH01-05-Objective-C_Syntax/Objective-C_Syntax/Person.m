//
//  Person.m
//  Objective-C_Syntax
//
//  Created by ignasiperez.com on 28/02/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

// IMPLEMENTATION FILE
//  - Where you implement your methods
//
// Pro tip: Press Ctrl+Cmd+UP to toggle between the header and implementation files

#import "Person.h"

// This is the place where you put the implementation of your interface.
@implementation Person


// '-'
//  - Marks the start of a normal method.
//  - If we had used '+' instead it would be a static method

// '(void)'
//  - Return type is placed in parenthesis before the method name.
- (void)printGreeting {
  NSLog(@"Hello without arguments!");
}


- (void)printGreeting:(NSString*) greeting {
  NSLog(@"%@", greeting);
}


// The coding convention in Objective-C is that the first parameter is part of the method name.
- (void)printGreetingTo:(NSString *)name {
  NSLog(@"Hello, %@", name);
}


// The goal is to create code that can be read aloud and sound relatively normal.
//  - This frequently means that second and subsequent parameters start with "and", "with", "at", or similar.
//  - The second parameter starts with the external label 'atTimeOfDay', which is what people see when calling it.
//    - 'time': is used inside the method
//    - This is a named parameter and is different from the first parameter because that should be named as part of the method.
//    - These named parameters form part of the selector.
- (void)printGreetingTo:(NSString *)name atTimeOfDay:(NSString *)time {
  if ([time isEqualToString:@"morning"]) {
    NSLog(@"Good morning, %@", name);
  } else {
    NSLog(@"Good evening, %@", name);
  }
}


//  ************************************************************
//  MARK: - CHAPTER 3 - CLASSES
//        - Methods - Multiple return values (p.092)
//

- (NSDictionary *)fetchGreetingTo:(NSString *)name atTimeOfDay:(NSString *)time {
  if ([time isEqualToString:@"morning"]) {
    return @ {
      @"English": [NSString stringWithFormat:@"Good morning, %@", name],
      @"French": [NSString stringWithFormat:@"Bonjour, %@", name]
    };
  } else {
    return @ {
      @"English": [NSString stringWithFormat:@"Good evening, %@", name],
      @"French": [NSString stringWithFormat:@"Bonsoir, %@", name]
    };
  }
}



@end
