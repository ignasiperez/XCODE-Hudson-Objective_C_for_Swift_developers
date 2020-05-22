//
//  Person.h
//  Objective-C_Syntax
//
//  Created by ignasiperez.com on 28/02/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//

// HEADER FILE
//  - Where you define your methods and properties.
//
// Pro tip: Press Ctrl+Cmd+UP to toggle between the header and implementation files

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// The external interface for the class is defined.
// Objective-C supports inheritance identically to Swift.
@interface Person : NSObject


// Function declaration
//  - 'main.m' imports only the header file, so as far as it's concerned the 'Person' class supports only the properties and methods listed here.
- (void)printGreeting;

- (void)printGreeting:(NSString*)greeting;
- (void)printGreetingTo:(NSString*)name;
- (void)printGreetingTo:(NSString *)name atTimeOfDay:(NSString*)time;

- (NSDictionary*)fetchGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time;


@end

NS_ASSUME_NONNULL_END
