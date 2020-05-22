//
//  main.m
//  Objective-C_Syntax
//
//  Created by ignasiperez.com on 23/01/2020.
//  Copyright © 2020 Ignasi Perez-Valls. All rights reserved.
//


//  ************************************************************
//  MARK: - CH1 - OVERVIEW - Concepts (p.011)
//


// The character ( # ) is a preprocessor directive
//  - It means, this code gets replaced by the proprocessor even before your code gets built.
//
// This particular directive means:
//  - Find the header file for Foundation (Apple's fundamental Objective-C framework),
//    - and paste it here.
//
// < > (Angle brackets) - Import a _system library_.
//  - "Search for this header in the systme libraries"
// " " (Double quotes)  - Import your own header files.
//  - "Search for this header in the system libraries, but also in my project".
#import <Foundation/Foundation.h>


// We need to import the header file for 'Person.h' to be able to use it.
#import "Person.h"



// `int main`
//  - The main function returns an integer.
//
// `int argc`
//  - The first parameter is an integer called `argc`.
//
// `const char * argv[]`
//  - The second parameter is an array of sttings called `argv`.
//
// This `main`function is the standard way to create command-line programs,
//  - and it will automatically be called when the program is run.
int main(int argc, const char * argv[]) {
  // '@autoreleasepool'means:
  //  - Allocating memory and freeing it when finished.
  @autoreleasepool {
    
    
    // `NSLog()`is a function akin to `print() in Swift.
    //
    // The `@`symbol gets abused extensively in Objective-C.
    //  - What it means is:
    //    - "This next bit is Objective-C, and definitelly not C"
    //
    // Without the `@`sign before "Hello, World!" the message would be interpreted as a _C_ String:
    //  - An array of characters in ASCII, ending with a 0.
    // Objective-C, like Swift, has its own string data structure that offers
    //  - Unicode compatibility, methods for manipulation and more.
    //
    // `NSLog()`expects to receive one of these Objective-C strings, not a C string.
    NSLog(@"\n\n --- CH1 - OVERVIEW - Concepts (p.011) --- \n");
    NSLog(@"Hello, World!");
    
    
    // Objective-C does not support _type inference_,
    //  - and unlike Swift, almost everything is created as a variable.
    //
    // When there is neither ´let´ not 'var´ then it is a variable.
    int a = 10;
    NSLog(@"- - - - -");
    NSLog(@"a: %d", a);
    
    
    // If you want to make it a _constant_:
    const int b = 20;
    NSLog(@"- - - - -");
    NSLog(@"b: %d", b);
    
    // `NSString`is a _class_ rather than a `struct`
    // The `NS`ia a namespace prefix.
    
    // Any kind of object, like `NSString`must be allocated using a special approach called _pointers_.
    //  - A _pointer_ is a reference to a location in memory where some specific data lives.
    //
    // `str` isn't an NSString, it's just a pointer to where an `NSString` exists in RAM.
    NSString *str = @"Reject common sense to make the impossible possible!";
    NSLog(@"- - - - -");
    NSLog(@"str: %@", str);
    
    // Let's briefly look at one more data type: array
    //  - You need `@`to start the array.
    NSArray *array = @[@"Hello", @"World 1"];
    NSLog(@"- - - - -");
    NSLog(@"array: %@", array);
    
    
    
    //  ************************************************************
    //  MARK: - CH1 - OVERVIEW - Basic syntax - Conditions (p.021)
    //
    
    NSLog(@"\n\n --- CH1 - OVERVIEW - Basic syntax - Conditions (p.021) --- \n");
    int x = 10;
    
    // Conditional statements mostly work the same as in Swift,
    //  - although you must always type parentheses around your conditions.
    if (x == 10) {
      NSLog(@"Hello, World!");
    } else {
      NSLog(@"Goodbye!");
    }
    
    
    
    //  ************************************************************
    //  MARK: - CH1 - OVERVIEW - Basic syntax - Switch/case (p.022)
    //
    
    NSLog(@"\n\n --- CH1 - OVERVIEW - Basic syntax - Switch/case (p.022) --- \n");
    
    // Case statements have implicit fallthrough.
    //  - This is the oposite of Swift,
    //    - and means you nearly always want to write `break;` at the end of `case` blocks
    //      - to avoid fallthroug.
    int i = 20;
    
    switch (i) {
      case 20:
        NSLog(@"It's 20!");
        // break;
        
      case 40:
        NSLog(@"It's 40!");
        break;
        
      case 60:
        NSLog(@"It's 60!");
        break;
        
      default:
        NSLog(@"It's something else.");
        break;
    }
    
    
    // Support for pattern matching,
    //  - but it's limited to range:
    //    - You write one number, then `...`with a space on either side, then another number:
    int v = 25;
    switch (v) {
      case 1 ... 30:
        NSLog(@"- - - - -");
        NSLog(@"It's between 1 and 30!");
        break;
        
      default:
        NSLog(@"It's something else.");
        break;
    }
    
    
    // You can't use the first line of a 'case' block to declare a new variable unlesss you wrap the 'case' block in braces.
    //    int w1 = 10;
    //    switch (w1) {
    //      case 10:
    //        int foo = 1; // <-
    //        NSLog(@"It's something else.");
    //    }
    
    // There are two ways to fix this problem:
    // WAY 1:
    //  - Make the 'NSLog()' line come first
    int w1 = 10;
    switch (w1) {
      case 10:
        NSLog(@"- - - - -");
        NSLog(@"It's something else.");
        int foo = 1; // <-- 'NSLog()' line come first
        NSLog(@"foo: %i", foo);
    }
    
    // WAY 2:
    //  - Place braces around the contents of the `case`block
    int w2 = 10;
    switch (w2) {
      case 10:
      { // <-
        int foo2 = 1;
        NSLog(@"foo2: %i", foo2);
        NSLog(@"It's something else");
      } // <-
    }
    
    
    
    //  ************************************************************
    //  MARK: - CH1 - OVERVIEW - Basic syntax - Loops (p.025)
    //
    
    NSLog(@"\n\n --- CH1 - OVERVIEW - Basic syntax - Loops (p.025) --- \n");
    NSArray *names = @[@"Kira", @"Tor", @"Coco"];
    
    for (NSString *name in names) {
      // 'NSLog' is a _variadic function_ that combines the string in its first parameter with the value of the values of the second and subsequent parameters.
      //  - _Variadic functions_ are functions that accept any number of parameters
      //
      // The '%@' part is called a _format specifier_,
      //  - and means "insert the contents of an object here"
      NSLog(@"Hello, %@", name);
    }
    
    // You can use C-style `for`loops like this:
    for (int i = 1; i <= 5; ++i) {
      // '%d' is another format specifier, and means "int"
      NSLog(@"\n%d * %d is %d", i, i, i * i);
    }
    
    // _FORMAT SPECIFIERS_:
    //  - String:         %@ <- "Content of object"
    //  - Character:      %c
    //  - Integer:        %d, %i
    //  - Long integers:  %ld
    //  - Floating-point: %f, %e, %E
    //  - Double floating-point:  %lf
    //  - Octal:          %o
    //  - Hexadecimal:    %x, %X
    //  - Pointers:       %p
    
    //  - Floating-point with 2 decimals: %.2f
    
    
    
    //  ************************************************************
    //  MARK: - CH1 - OVERVIEW - Basic syntax - Calling methods (p.026)
    //
    
    NSLog(@"\n\n --- CH1 - OVERVIEW - Basic syntax - Calling methods (p.026) --- \n");
    
    // 'new' is a message you send to the 'MyObject' class
    //   - NOTE: Although this is technically called "sending a message",
    //     - I'll be referring to it as "calling a method" from now on because
    //       - that's what everyone except Apple calls it.
    //    MyObject *myObject = [MyObject new];
    NSString *myString = [NSString new];
    
    // Call two methods at once
    //  - Swift:        myObject.method1().method2()
    //  - Objective-C:  [[myObject method1] method2]
    NSString *myString2 = [[myString stringByAppendingString:@"Hello!"]
                           uppercaseString];
    NSLog(@"myString2: %@", myString2);
    
    
    // One particular place when you are likely to use two method calls on a single line
    //  - is when creating objects.
    //
    // You've already seen the `new`method,
    //  - which allocates memory for an object and initializaes it with some default information.
    //    - However you can also run those two parts individually:
    //      - allocate some memory with one method,
    //      - then initialize a value with a second:
    //  MyObject *myObject = [[MyObject alloc] init]
    NSString *myString3 = [[NSString alloc] init];
    myString3 = @"123-456789";
    
    // The lack of commas means that it is stylistically prefered
    //  - not to place a space after the colon for _named parameters_.
    // Swift:       myObject.executeMethod(hello, param2: world)
    // Objective-C: [myObject executeMethod:hello param2:world];
    //    [myString3 get
    
    NSString *myString4 = [myString3 stringByReplacingOccurrencesOfString:@"123"
                                                               withString:@"ABC"];
    NSLog(@"- - - - -");
    NSLog(@"myString4: %@", myString4);
    
    
    
    //  ************************************************************
    //  MARK: - CH1 - OVERVIEW - Basic syntax - Nil coalescing (p.027)
    //
    
    NSLog(@"\n\n --- CH1 - OVERVIEW - Nil coalescing (p.027) --- \n");
    
    // One useful way of ensuring a value exists is to use _nil coalescing_.
    //  - Objective-C doesn't have a dedicated `??` operator for this,
    //    - but instead allows you to hijack the _ternary operator_ `?:`.
    //
    // Print a name or "Anonymous" depending on whether the `name` variable has a value
    NSString *name = nil;
    NSLog(@"Hello, %@!", name ?: @"Anonymous");
  }
  
  
  
  //  ************************************************************
  //  MARK: - CH1 - OVERVIEW - Pointers (p.029)
  //
  
  NSLog(@"\n\n --- CH1 - OVERVIEW - Pointers (p.029) --- \n");
  
  // All Objective-C objects must be pointers
  //
  // `NSString` is an immutable class,
  //  - which means its value cannot be changed once it has been created.
  //  - When you think your're changing its value,
  //    - what's actually happening is that the old string is destroyed,
  //      - a new one is created,
  //      - and the pointer is updated to reflect the change.
  NSString *first = @"Hello";
  NSLog(@"%p", first);
  first = @"World";
  NSLog(@"%p", first);
  
  
  // If we want to create a string that can't be changed,
  //  - what we need is a _constant pointer_.
  NSString * const second = @"Hallo";
  NSLog(@"second %@", second);
  
  //  second = @"Wallt"; <- ERROR
  // ERROR: Cannot assign to variable `second` with const-qualified type 'NSString *const __strong'
  
  
  
  //  ************************************************************
  //  MARK: - CH1 - OVERVIEW - The size of integers (p.032)
  //
  
  // NSInteger:
  //  - On 32-bit systems holds a 32-bit number
  //  - On 64-bit systems holds a 64-bit number
  //
  // You should specify the exact size you need using `int32_t`` or `int64_t`.
  //  - That way, the integer size is preserved regardless of what CPU you're running on.
  
  // CGFloat:
  // - Is design to map to either _float_ or _double_ depending on the current CPU.
  
  
  
  //  ************************************************************
  //  MARK: - CH1 - OVERVIEW - What is truth (p.034)
  //
  
  // _Core Graphics_ usaully use 'bool',
  //  - whereas its Objective-C frameworks like UIKit usually use 'BOOL'.
  //
  // If you're starting a project fresh and don't have existing code to examine, go with
  //  - 'BOOL', 'YES', and 'NO' until you find a reason not to.
  
  
  
  //  ************************************************************
  //  MARK: - CH1 - OVERVIEW - Format specifiers (p.035)
  //
  
  NSLog(@"\n\n --- CH1 - OVERVIEW - Format specifiers (p.035) --- \n");
  
  // M_PI is a constant defined for you as a macro:
#define M_PI2 3.141519653589
  // %.2f: Print a _floating-point_ number up to two decimal places.
  NSLog(@"%.2f", M_PI2);
  
  
  NSInteger p = 10;
  // `%ld`: Print the value of long integers.
  //
  // `(long)p: `NSInteger` varies in size depending on the CPU,
  //  - which causes a problem: `%d` is for `int,
  //    - which will cause problems for 64-bit CPUs.
  //  - The easiest solution is to use the `%ld` format specifier,
  //    - then add a typecast to force the parameter to be a _long integer_
  NSLog(@"%ld", (long)p);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Strings (p.037)
  //
  
  // Although Objective-C strings have some similarities to Swift strings, there are some diferences:
  //
  //  - `NSString` is a class not a struct,
  //    - which means it's a _reference type_.
  //
  //  - It works with Unicode (UTF-16, specifically)
  //
  //  - You can bridge it to and from Swift's `String` using an `as` typecast in Swift.
  //
  //  - It comes with built-in methods to convert strings to other data types,
  //    - such as integers and floats.
  //
  //  - Strings are immutable by default, but they aren't constant.
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Strings - Creating Strings (p.037)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Strings - Creating Strings (p.037) --- \n");
  
  // We are going to see 4 different ways for creating strings:
  //
  // FIRST WAY
  NSString *str1 = @"Hello, World!";
  NSLog(@"FIRST WAY str1: %@", str1);
  
  
  // SECOND WAY
  //  - Using the same format specifiers we've used for `NSLog()`
  NSInteger number2 = 42;
  NSString *str2 = [NSString
                    stringWithFormat:@"You picked number %ld",
                    (long)number2];
  NSLog(@"- - - - -");
  NSLog(@"SECOND WAY str2 %@", str2);
  
  
  // THIRD WAY
  //  - By using `alloc`/`init`
  NSInteger number3 = 82;
  NSString *str3 = [[NSString alloc]
                    initWithFormat:@"You picked %ld",
                    (long)number3];
  NSLog(@"- - - - -");
  NSLog(@"THIRD WAY str3 %@", str3);
  
  // In 2011, _Automatic Reference Counting_ (_ARC_) was introduced,
  //  - which meant that Xcode was able to relaease memory once it was no longer needed.
  //  - Before that, programmers needed to allocate and free memory by hand,
  //    - and if you forgot to free something then you had a _memory leak_.
  
  
  // FOURTH WAY
  //  - From the contents of a file.
  NSString *str4 = [[NSString alloc]
                    initWithContentsOfFile:@"hello.txt"
                    usedEncoding:(nil) error:nil];
  NSLog(@"- - - - -");
  NSLog(@"FOURTH WAY str4: %@", str4);
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Strings - Manipulating and evaluating strings (p.039)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Strings - Manipulating and evaluating strings (p.039) --- \n");
  
  // `NSString has a huge collection of methods for manipulating strings.
  //  - I've listed some below so you can get a taste:
  
  // 1. Replacing one substring with another
  NSString *nsString1 = [[NSString alloc] init];
  nsString1 = @"+49 617 650 321";
  
  NSString *nsString1b = [nsString1
                          stringByReplacingOccurrencesOfString:@"+49"
                          withString:@"+1"];
  
  NSLog(@"1. nsString1b: %@", nsString1b);
  // nsString1b is now: +1 617 650 321
  
  // 2. Adding a new string to the existing one,
  //  - making a new string.
  NSLog(@"- - - - -");
  
  NSString *nsString2 = @"Hello";
  NSString *nsString2b = [nsString2
                          stringByAppendingString:@" World!"];
  NSLog(@"2. nsString2b: %@", nsString2b);
  // nsString2b is now: Hello World!
  
  // 3. Adding a new string with formatting specifiers to the esisting one,
  //  - making a new string.
  NSLog(@"- - - - -");
  
  NSString *nsString3 = @"Some text";
  NSString *nsString3b = [nsString3
                          stringByAppendingFormat:@" = %d",
                          3];
  NSLog(@"3. nsString3b: %@", nsString3b);
  // nsString3b is now: Some text = 3
  
  // 4. Create a new string using part of the existing one
  NSLog(@"- - - - -");
  
  NSString *nsString4 = @"+49 617 650 321";
  NSString *nsString4b = [nsString4
                          substringFromIndex:3];
  NSLog(@"4. nsString4b: %@", nsString4b);
  // nsString4b is now: 617 650 321
  
  
  // 5. Create an array by splitting a string
  NSLog(@"- - - - -");
  
  NSString *nsString5 =  @"+49 617 650 321;+3 617 650 321;+44 534 793 428";
  NSArray *nsArray5 = [nsString5
                       componentsSeparatedByString:@";"];
  NSLog(@"5. nsArray5: %@", nsArray5);
  // nsArray5 is now:
  // ("+49 617 650 321"
  //  "+3 617 650 321"
  //  "+44 534 793 428")
  
  
  // 6. Convert a string into an integer,
  //  - or `0`if it's an invalid integer.
  NSLog(@"- - - - -");
  
  NSString *nsString6 = @"617";
  NSLog(@"6. nsString6: %ld",[nsString6 integerValue]);
  // Prints out: 617
  
  // Also, `doubleValue`and `floatValue`
  
  
  // 7. Convert a string to a boolean.
  //  - Returns true
  //     - if the string starts with `Y`, `y`, `T`, `t`,
  //     - or the digits `1`to `9`.
  //       - A `0` value always means NO.
  NSLog(@"- - - - -");
  
  NSString *nsString7 = @"TRUE";
  BOOL boolValue = [nsString7 boolValue];
  NSLog(@"7. boolValue: %@", boolValue ? @"YES" : @"NO");
  
  
  // 8. Returns true if string A contains string B
  NSLog(@"- - - - -");
  NSString *nsString8 = @"+49 617 650 321";
  BOOL containsPrefix = [nsString8 containsString:@"+49"];
  NSLog(@"8. containsPrefix: %@", containsPrefix ? @"YES" : @"NO");
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Strings - Mutable strings (p.039)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Strings - Mutable strings (p.039) --- \n");
  
  // Mutability is controlled by the class name you want to use:
  //  - `NSString`
  //  - `NSMutableString`
  
  // When we try to place an immutable object inside a mutable container it gives an error.
  // ERROR: Incompatible pointer types initializing 'NSMutableString *' with an expression of type 'NSString *'
  // > NSMutableString *mutable = @"Hello";
  
  
  // FIRST WAY OF CREATING A MUTABLE STRING
  //  - Create a mutable copy of a String
  NSMutableString *hello1 = [@"Hello!" mutableCopy];
  NSLog(@"1. hello1: %@", hello1);
  
  // SECOND WAY OF CREATING A MUTABLE STRING
  //  - Use the mutable string initizalizer 'stringWithFormat')
  NSMutableString *hello2 = [NSMutableString
                             stringWithFormat:@"Hello!!"];
  NSLog(@"- - - - -");
  NSLog(@"2. hello2: %@", hello2);
  
  
  // THIRD WAY OF CREATING A MUTABLE STRING
  // - Use the mutable string initizalizer `stringWithCapacity`
  //
  // This initializaer lets you tell the system how big you expect the string to grow.
  //  - In our example we tell the system to store up to 4096 characters.
  NSMutableString *longString = [NSMutableString
                                 stringWithCapacity:4096];
  NSLog(@"- - - - -");
  NSLog(@"3. longString... %@", longString);
  
  
  // CREATE AND MODIFY A MUTABLE STRING
  //  - To modify a mutable string we use the `setString` method)
  NSMutableString *mutableString = [@"My string" mutableCopy];
  [mutableString setString:@"Something else"];
  NSLog(@"- - - - -");
  NSLog(@"4. mutableString: %@", mutableString);
  
  
  // NOT A GOOD IDEA ASSIGN AN `NSMutableString` to a regular `NSString`
  NSMutableString *strA = [@"My string" mutableCopy];
  NSString *strB = strA;
  [strA setString:@"Something else"];
  NSLog(@"- - - - -");
  NSLog(@"5. strB: %@", strB);
  // Output is "Something else"
  //  - Even thought we thought `strb` was a non-mutable string with value "My string",
  //   - we actually didn't,
  //     - and it got changed under the feet.
  
  
  // This uncertainty is unwelcome, and the SOLUTION MOST PEOPLE USE is
  // - to take copies of values during assignment
  NSMutableString *strC = [@"My original string" mutableCopy];
  NSString *strD = [strC copy];
  [strC setString:@"And even another thing"];
  NSLog(@"- - - - -");
  NSLog(@"6. strD: %@", strD);
  // Prints out: "My string C"
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Strings - Useful functions (p.042)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Strings - Useful functions (p.042) --- \n");
  
  // There are several globl functions that create an `NSString`
  //  - from various types of input data.
  //
  // This is mainly useful when using `NSLog()`,
  //  - because it let you neatly print out structures like CGRect.
  //
  // Example of the most useful functions:
  
  // 1. Give it a class name, e.g.g[myObject class],
  //  - and it will return "MyObject".
  NSString *nameOfClass = NSStringFromClass([NSArray class]);
  NSLog(@"1. nameOfClass: %@", nameOfClass);
  // Prints out: "1. nameOfClass: NSArray"
  
  
  // 2. Give it a `CGRect` and get back the origin and size in one string.
  // CGRectMake(x-origin, y-origin, width, height)
  CGRect rectangle = CGRectMake(30.00, 20.00, 200.0, 10.0);
  NSLog(@"- - - - -");
  NSLog (@"2. rectangle: %@", NSStringFromRect(rectangle));
  // Prints out: "2. rectangle: {{30, 20}, {200, 10}}"
  
  
  // 3. Give it a `CGSize` and get back the width and height values.
  // CGRectMake(x-origin, y-origin, width, height);
  CGSize size = CGSizeMake(200.0, 10.0);
  NSLog(@"- - - - -");
  NSLog (@"3. size: %@", NSStringFromSize(size));
  
  // 4. Give it a `CGPoint`and get back the X and Y coordinates.
  CGPoint point = CGPointMake(30, 20);
  NSLog(@"- - - - -");
  NSLog (@"4. point: %@", NSStringFromPoint(point));
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Numbers (p.043)
  //
  
  // NSInteger, NSUInteger, int64_t and CGFloat are all "Primitive types"
  //  - They are raw numbers that can be manipulated directly by the CPU.
  //
  // NSNumber is an "Object"
  //  - Is designed to be a storage device.
  //    - Arrays and Dictionaries can only hold objects.
  
  
  // `NSInteger` holds only integers.
  //
  // `NSNumber` can hold int, NSInteger, floats, doubles, and even booleans.
  //   - This means, you can create it from an integer,
  //    - and read it back as a double,
  //      - or create it as a boolean and read it backj as a float.
  
  
  // As arrays and dictionaries can only hold objects,
  //   - this means that you can't place integers into arrays, nor floats, or booleans.
  //    - This is a huge problem, so Objective-C gives us `NSNumber`:
  //      - A class that serves to wrap each of those number types in an object.
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Numbers - Creating NSNumbers (p.044)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Strings - Numbers - Creating NSNumbers (p.044) --- \n");
  
  // There are different initializers to create `NSNumber` instances.
  
  // 1. Accept an `NSInteger` or int.
  NSNumber *ten = [NSNumber numberWithInt:10];
  NSLog(@"1. ten: %@", ten);
  
  
  // 1a. Read back as a float value.
  float floatTen = [ten floatValue];
  NSLog(@"- - - - -");
  NSLog(@"1a. floatTen: %f", floatTen);
  
  
  // 1b. Read back as an int.
  int intTen = [ten intValue];
  NSLog(@"- - - - -");
  NSLog(@"1a. floatTen: %i", intTen);
  
  
  // 1c. Read back as a long integer.
  long integerTen = [ten integerValue];
  NSLog(@"- - - - -");
  NSLog(@"1c. floatTen: %ld", integerTen);
  
  
  // However, it's more comon to see more `@` symbol abuse to declare `NSNumber`
  //  - with _literal syntax_.
  //  - Using this technique, you can just write `@` followed by
  //    - an integer, a float, a double, or a boolean,
  //     - and the compiler will produce a `NSNumber` for you.
  
  // 2a. @integer
  NSNumber *eleven = @11;
  NSLog(@"- - - - -");
  NSLog(@"2a. eleven: %@", eleven);
  
  
  // 2b. @boolean.
  NSNumber *booleanTrue = @YES;
  NSLog(@"- - - - -");
  NSLog(@"2b. booleanTrue: %@", booleanTrue);
  
  
  // 2c. @double.
  NSNumber *doublePi = @M_PI;
  NSLog(@"- - - - -");
  NSLog(@"2c. doublePi: %@", doublePi);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Arrays (p.045)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Arrays (p.045) --- \n");
  
  // 1a. BASIC ARRAY EXAMPLE
  //  - Using _Array literal_ '@[...]'
  NSArray *villains = @[@"Weeping Angels",
                        @"Cybermen",
                        @"Daleks",
                        @"Vashta Nerada"];
  
  // 1b. Looping over an array using _fast enumeration_.
  for (NSString *villain in villains) {
    NSLog(@"2b. Can the Doctor defeat the %@? Yes he can!", villain);
  }
  
  
  // 2a. CREATE ARRAYS USING AN INITIALIZER
  //  - `arrayWithObjects` (The most commom initializer)
  
  // Note that there is a `nil` at the end.
  //  - If you fail to add that Xcode will give you a WARNING:
  //   - "Missing sentinel in method dispatch"
  NSArray *villains2 = [NSArray arrayWithObjects:
                        @"Weeping Angels",
                        @"Cybermen",
                        @"Daleks",
                        @"Vashta Nerada",
                        nil];
  
  // 2b. You can loop in reverse using the `reverseObjectEnumerator` method.
  NSLog(@"- - - - -");
  for (NSString *villain2 in [villains reverseObjectEnumerator]) {
    NSLog(@"2b. Can the Doctor defeat the %@? Yes he can!", villain2);
  }
  
  
  // 3a. You can index into an array just like in Swift.
  NSLog(@"- - - - -");
  NSLog(@"3a. The %@ are my favorite villains.", villains2[2]);
  
  
  // 3b. Older code written before subscripting was introduced,
  //  - anything not rewritten since 2012 or earlier,
  //   - will use the `objectAtIndex` method instead.
  NSLog(@"- - - - -");
  NSLog(@"3b. The %@ are my favorite villains.", [villains2 objectAtIndex:2]);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Arrays - Basic array  usage (p.046)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Basic array usage (p.046) --- \n");
  
  // Arrays in Objective-C have all the basic methods you expect of them,
  //  - although sometimes they have longer names than you might like.
  
  // 1. Return the number of items in an array.
  NSLog(@"- - - - -");
  NSLog(@"1. The Doctor faced %ld villains in that episode.",
        (long) [villains2 count]);
  
  
  // 2. Return the location of an item in an array
  //
  // If the object doesn't exist in the array, you get back a special value: `NSNotFound`
  //  - This is defined as a very large integer: 9,223,372,036,854,775,807 on 64-bit systems.
  NSLog(@"- - - - -");
  NSLog(@"`2. Daleks are villain number %ld.",
        (long) [villains2 indexOfObject:@"Daleks"]);
  
  
  // 3. Convert an array into a string using another string as glue.
  NSLog(@"- - - - -");
  NSLog(@"3. The Doctor conquered these villains: %@.",
        [villains2 componentsJoinedByString:@", "]);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Arrays - Mutable arrays (p.047)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Mutable arrays (p.047) --- \n");
  
  // You create _mutable arrays_ either using initializers from the `NSMutableArray` class
  //   - or by calling `mutableCopy` on an existing `NSArray`.
  NSMutableArray *villains3 = [@[
    @"Weeping Angels",
    @"Cybermen",
    @"Daleks",
    @"Vashta Nerada"] mutableCopy];
  
  
  // Once you have a _mutable array_, you can add individual or multiple objects at a time:
  //
  // 1a. Insert individual objects
  //
  //  - (void)insertObject:(ObjectType)anObject atIndex:(NSUInteger)index;
  //
  [villains3 insertObject:@"The Silence" atIndex:1];
  NSLog(@"1a. villains3: %@", villains3);
  
  
  // 1b. Insert multiple objects
  //
  //  - (void)addObjectsFromArray:(NSArray<ObjectType> *)array;
  //
  NSArray *otherVillains = @[@"The Daltons",
                             @"Billy the Kid"];
  
  [villains3 addObjectsFromArray:otherVillains];
  
  NSLog(@"- - - - -");
  NSLog(@"1b. villains: %@", villains3);
  
  
  // For removing you can use three different methods:
  //
  // 2a. Remove all instances of an object in an array.
  //
  //  - (void)removeObject:(ObjectType)anObject;
  //
  [villains3 removeObject:@"Billy the Kid"];
  NSLog(@"- - - - -");
  NSLog(@"2a. villains: %@", villains3);
  
  
  // 2b. Remove the object at a precise index.
  //
  //  - (void)removeObjectAtIndex:(NSUInteger)index;
  //
  [villains3 removeObjectAtIndex:3];
  NSLog(@"- - - - -");
  NSLog(@"2b. villains: %@", villains3);
  
  // 2c. Revome all objects, which leaves the array empty.
  //
  //  - (void)removeAllObjects;
  //
  [villains3 removeAllObjects];
  NSLog(@"- - - - -");
  NSLog(@"2c. villains: %@", villains3);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Arrays - Sorting (p.048)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Arrays - Sorting (p.048) --- \n");
  
  // Unlike Swift, Objective-C doesn't provide build-in sorting or any data types,
  //  - but it does provide some hooks where you can write your own
  //   - more or less equivalent to using `sort()` with a closure in Swift.
  //
  // `NSString' has a built-in method called `compare`,
  //   - compares one string against another and return whether string A comes before or after B.
  
  NSMutableArray *villains4 = [@[
    @"Weeping Angels",
    @"Cybermen",
    @"Daleks",
    @"Vashta Nerada"] mutableCopy];
  
  // We can use `compare` to sort an array by using it with the `sortedArrayUsingSelector'` method.
  //  - `@selector` is almost identical so Swift's `#selector` syntax.
  //   - If you call a method that accepts a parameter you allways need to include the colon, i.e.
  //    - `compare:` rather than `compare`
  //
  //  - (NSArray<ObjectType> *)sortedArrayUsingSelector:(SEL)comparator;
  //
  NSArray *villains4Sorted = [villains4
                              sortedArrayUsingSelector:@selector(compare:)];
  
  for (NSString *villain4 in villains4Sorted) {
    NSLog(@"villain: %@", villain4);
  }
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Arrays - Functional techniques (p.049)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Arrays - Functional techniques (p.049) --- \n");
  
  // Three useful methods to take into account:
  //
  // 1. `makeObjectsPerformSelector`
  //  - Is designed to run a method on every item in an array.
  //  - It doesn't return anything.
  //
  //  - (void)makeObjectsPerformSelector:(SEL)aSelector;
  //
  //  - It's commonly used for things like removing all child views from a parent, like this
  //
  //  [[self.view subviews]
  //    makeObjectsPerformSelector:@selector(removeFromSuperview)];
  
  
  // 2a. `enumerateObjectsUsingBlock`
  //  - We can rewrite the _fast enumeration loop_ from the beginning of this chapter:
  //
  // - (void)enumerateObjectsUsingBlock:
  //    (void (^)(ObjectType obj, NSUInteger idx, BOOL *stop))block;
  //
  [villains4 enumerateObjectsUsingBlock:^(id obj,
                                          NSUInteger idx,
                                          BOOL *stop) {
    NSLog(@"2. Can the Doctor defeat the %@? Yes he can!", obj);
  } ];
  
  //  - There is a caret symbol `^` followed by a list of parameters in parenthesis,
  //   - then the contents of the block itself.
  //     - Here the contents of the block is just the `NSLog()` line,
  //      - and it will receive three parameters:
  //       - `obj`: Has the data type `id`, which is Objective-C's version of Swift's `AnyObject`.
  //       - `idx`: Is the position of the current item in the array.
  //       - `*stop`: Is a pointer to a boolean.
  //        - If it were a regular boolean, not a pointer to a boolean,
  //         - you could change its value in the block
  //          - but that wouldn't be visible ouside the block.
  
  
  // 2b. To demonstrate the `stop` parameter,
  //  - this exmaple loops through several villains,
  //   - but stops when it reaches the Daleks viallain
  NSLog(@"- - - - -");
  [villains4 enumerateObjectsUsingBlock:^(id obj,
                                          NSUInteger idx,
                                          
                                          BOOL *stop) { // <-
    // Even though `obj` is of type `id`, any object,
    //  - we can still call `isEqualToString` on it.
    if ([obj isEqualToString:@"Daleks"]) {
      NSLog(@"2b. Can the Doctor defeat the %@? Oh, apparently!", obj);
      // `*stop` means: "Change the value that `stop` is pointing to.
      *stop = true; // <-
    }
    else {
      NSLog(@"2b. Can the Doctor defeat the %@? Yes he can!", obj);
    }
  } ];
  
  // If you find block syntax difficult to remember,
  //  - you should take comfort in knowing that http://goshdarnblocksyntax.com/ exists.
  
  
  // 3. `filteredArrayUsingPredicate`
  //  - If you've used _Core Data_ or _CloudKit_ before,
  //   - you'll be familiar with the concept of `NSpredicate`:
  //    - A class designed to store how data should be fetched or filtered.
  //     - This can be used to emulate Swift's `filter()` method.
  
  // In this example we return a `NSPredicate` instance
  //  - with only villains that have names made up of two words.
  NSLog(@"- - - - -");
  NSPredicate *predicate = [NSPredicate
                            predicateWithBlock:^BOOL(id  obj,
                                                     NSDictionary *bindings) {
    // The body of the block takes the input object being tested (`obj`),
    //  - splits it up by spaces,
    //  - then counts the resulting array.
    //  - If the count is equal to 2 then the item is included in the filtered array, otherwise not.
    return [[obj componentsSeparatedByString:@" "] count] == 2;
  }];
  
  NSArray *twoWordVillains = [villains4
                              filteredArrayUsingPredicate:predicate];
  
  for (NSString *twoWordVillain in twoWordVillains) {
    NSLog(@"3. Two word villain: %@", twoWordVillain);
  }
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Arrays - Key paths (p.051)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Arrays - Key paths (p.051) --- \n");
  
  // Key paths
  //  - are a feature that is rarely used even in old Objective-C
  //  - exist in Swift and are used for key-value observing.
  //   - For example you can monitor the progress of a `WKWebVie` loading a web page
  //    - by observing its `estimatedProgress` _key path_.
  
  // In Objective-C, arrays have a method called `valueForKeyPath` where you can
  //  - use collection operators to calculate information about your array.
  //
  // For example, you can use '@sum.self' on an integer array
  //  - to have the sum of all items returned as an `NSNumber`.
  
  // #ERROR
  //    NSArray *integerNumbers = [NSArray
  //                        arrayWithObjects:@1, @2, @3, @4, @5, nil];
  //
  //    NSNumber *sum = [integerNumbers valueForKeyPath:@"sum.self"];
  //    NSNumber *avg = [integerNumbers valueForKeyPath:@"avg.self"];
  //    NSNumber *min = [integerNumbers valueForKeyPath:@"min.self"];
  //    NSNumber *max = [integerNumbers valueForKeyPath:@"max.self"];
  //
  //    NSLog(@"Total: %ld", (long)[sum integerValue]);
  //    NSLog(@"Avg: %ld", (long) [avg integerValue]);
  //    NSLog(@"Min: %ld", (long) [min integerValue]);
  //    NSLog(@"Max: %ld", (long) [max integerValue]);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Dictionaries (p.053)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Dictionaries (p.053) --- \n");
  
  // Dictionaries get a lot of use in Objective-C because the language has no support for tuples.
  //  - When you want to return multiple values from a method, expect to use dictionaries.
  
  // 1. Create a dictionary with LITERAL SYNTAX:
  //  - @{element1, element2... }
  
  NSDictionary *ships = @{
    @"Serenity": @"Firefly",
    @"Enterprise": @"Star Trek",
    @"Executor": @"Star Wars"
  };
  
  
  // 2. Create a dictionary with TRADITIONAL SYNTAX:
  //  - `dictionaryWithObjectsAndKeys` accepts its parameters in the opposite order to Swift.
  //   - You specify the value first, then the key.
  //  - You use commas to separate key/value pairs and each key and value.
  NSDictionary *ships2 = [NSDictionary
                          dictionaryWithObjectsAndKeys:
                          @"FireFly", @"Serenity",
                          @"Star Trek", @"Enterprise",
                          @"Star Wars", @"Executor",
                          nil];
  
  
  // 3a. New way of READING VALUES BACK ROM A DICTIONARY.
  for (NSString *key in ships) {
    NSLog(@"3a. The ship %@ features in %@", key, ships[key]);
  }
  
  
  // 3b. Old way of READING VALUES BACK ROM A DICTIONARY.
  NSLog(@"- - - - -");
  for (NSString *key2 in ships2){
    NSLog(@"3b. The ship %@ features in %@",
          key2,
          [ships2 objectForKey: key2]);
  }
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Dictionaries - Useful methods (p.055)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Dictionaries - Useful methods (p.055) --- \n");
  
  // 1. Return how many items are in the dictionary
  NSUInteger numberOfItems = [ships count];
  NSLog(@"1. numberOfItems: %lu", (unsigned long)numberOfItems);
  
  
  // 2. Return an array with all the keys
  NSArray *shipsKeys = [ships allKeys];
  NSLog(@"- - - - -");
  NSLog(@"2. shipsKeys: %@", shipsKeys);
  
  
  // 3. Returnn an array of all the values
  NSArray *shipsValues = [ships allValues];
  NSLog(@"- - - - -");
  NSLog(@"2. shipsValues: %@", shipsValues);
  
  
  // 4. Get the _values_ with `enumerateKeysAndObjectsUsingBlock``
  NSLog(@"- - - - -");
  [ships enumerateKeysAndObjectsUsingBlock:^(id key,
                                             id obj,
                                             BOOL *stop) {
    if ([obj isEqualToString:@"Star Trek"]) {
      NSLog(@"4. Star Trek found!");
      *stop = true;
    }
    else {
      NSLog(@"4. Looking for Star Trek, instead I've found %@", obj);
    }
  }];
  
  
  // 5. Get the _keys_ with `enumerateKeysAndObjectsUsingBlock``
  NSLog(@"- - - - -");
  [ships enumerateKeysAndObjectsUsingBlock:^(id key,
                                             id obj,
                                             BOOL *stop) {
    if ([key isEqualToString:@"Enterprise"]) {
      NSLog(@"5. Enterprise found!");
      *stop = true;
    }
    else {
      NSLog(@"5. Looking for Enterprise, instead I've found %@", key);
    }
  }];
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Sets - NSSet (p.056)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Sets - NSSet (p.056) --- \n");
  
  // Objective-C has two ways of creating sets:
  //  - `NSSet`: Has a mutable counterpart in 'NSMutableSet'.
  //  - `NSCountSet`: Is automatically mutable.
  
  // Sets are faster than arrays for determining whether they contain an object because:
  //  - they are unordered
  //   - so objects are accessed using a hash.
  //  - objects must appear only once.
  
  // Useful Set methods
  //
  // 0a. Create a set object with `setWithObjects`method
  NSSet *odd = [NSSet setWithObjects: @1, @3, @5, @7, @9, nil];
  NSSet *even = [NSSet setWithObjects:@2, @4, @6, @8, @10, nil];
  
  
  // 0b. Create a set object from an existing `NSArray`
  NSArray *pets = @[@"Kira",
                    @"Tor",
                    @"Coco",
                    @"Lluna"];
  //
  // - (instancetype)setWithArray:(NSArray<ObjectType> *)array;
  //
  NSSet *petsSet = [NSSet setWithArray:pets];
  NSLog(@"0b. petsSet: %@", petsSet);
  
  
  // 1. Return the number of items
  NSUInteger oddCount = [odd count];
  NSLog(@"- - - - -");
  NSLog(@"1. oddCount: %lu", (unsigned long)oddCount);
  
  
  // 2. Determine if an object ist in the set
  //
  // - (BOOL)containsObject:(ObjectType)anObject;
  //
  NSLog(@"- - - - -");
  if ([odd containsObject:@5]) {
    NSLog(@"2. odd contains object 5");
  }
  
  
  // 3. Determine if one set overlaps another
  //
  // - (BOOL)intersectsSet:(NSSet<ObjectType> *)otherSet;
  //
  NSLog(@"- - - - -");
  if ([odd intersectsSet:even]) {
    NSLog(@"3a. odd overlaps even");
  }
  else {
    NSLog(@"3b. odd does not overlap even");
  }
  
  
  // 4. Returns a new set formed by adding the objects in a given set to the receiving set.
  //
  // - (NSSet<ObjectType> *)setByAddingObjectsFromSet:(NSSet<ObjectType> *)other;
  //
  NSSet *combined = [odd setByAddingObjectsFromSet:even];
  NSLog(@"- - - - -");
  NSLog(@"4. combined: %@", combined);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Sets - NSMutableSet (p.056)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Sets - NSMutableSet (p.056) --- \n");
  
  // 0. Create a mutable set from a set
  NSMutableSet *mutableSet = [combined mutableCopy];
  NSLog(@"0. mutableSet: %@", mutableSet);
  
  
  // 1. Add a given object to the mutable set
  //
  // - (void)addObject:(ObjectType)object;
  //
  [mutableSet addObject:@0];
  NSLog(@"- - - - -");
  NSLog(@"1a. mutableSet with item 0 added: %@", mutableSet);
  
  [mutableSet addObject:@1];
  NSLog(@"- - - - -");
  NSLog(@"1b. mutableSet with item 1 added: %@", mutableSet);
  
  
  
  // 2. Remove all items of a mutable set
  //
  // - (void)removeAllObjects;
  //
  NSMutableSet *petsMutableSet = [petsSet mutableCopy];
  
  [petsMutableSet removeAllObjects];
  NSLog(@"- - - - -");
  NSLog(@"7. petsMutableSet after removeAllObjects method: %@", petsMutableSet);
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Sets -  NSCountedSet (p.056)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Sets - NSCountedSet (p.056) --- \n");
  
  // `NSCountedSet`:
  //  - Bends the rule a little:
  //   - We know that objects can only appear once inside it,
  //    - but each time you add or remove an item it keps track of
  //     - how many times it would have appeared.
  //
  //  - This makes it a fast way to count the number of times objects appear in a collection.
  NSCountedSet *numbers = [NSCountedSet setWithObjects:
                           @1, @1, @2, @3, @3 , @3, @5, @6, @6, @8, @8, @8, nil];
  
  NSLog(@"1a. numbers: %@", numbers);
  
  for (NSString *value in [numbers allObjects]) {
    NSLog(@"1b. %@ appears %ld times", value, [numbers countForObject:value]);
  }
  
  
  
  //  ************************************************************
  //  MARK: - CH2 - DATA TYPES - Generics (p.058)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Generics (p.058) --- \n");
  
  // Generics exist in Objective-C, but
  //  - They aren't anywhere like as beneficial as they are in Swift.
  //  - They are so new that most projects don't use them.
  
  NSMutableArray<NSString *> *names = [NSMutableArray arrayWithCapacity:4];
  [names addObject:@"Sophie"];
  [names addObject:@"42"];
  
  // If you try to read a value from an array and store it in a different type,
  //  - it will warn you:
  //   - ERROR: Redefinition of 'number' with a different type:
  //     - 'NSNumber *__strong' vs 'NSInteger' (aka 'long')
  //
  //  NSNumber *numbers = names[0];
  
  
  // RUNTIME ERROR:
  //  - Thread 1: Exception: "-[__NSCFNumber length]: unrecognized selector sent to instance 0x8..."
  //
  //    NSArray<NSNumber *> *numbers2 = @[@42, @556, @69, @3.141];
  //    for (NSString *number2 in numbers2) {
  //      NSLog(@"1. %@ is %ld letters.", number2, [number2 length]);
  //    }
  
  
  // You cal also make generic dictionaries and generic sets,
  //  - and they all work in the same way.
  //
  // With dictionaries you need to specify a type for the key and another for the value.
  NSDictionary<NSString *, NSNumber *> *villains5 = @{
    @"Daleks" : @100,
    @"Cybermen" : @80
  };
  NSLog(@"1. villains5: %@", villains5);
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - NSValue (p.061)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - NSValue (p.061) --- \n");
  
  // Objective-C's Collection types are designed to store objects
  //  - this means that arrays of integers are only possible
  //   - if you wrap the integers inside `NSNumber` instances.
  
  // `CGRect`, `CGSize` and `CGPoint` are all structs in Objective-C.
  //  - Apple's solution to this is
  //   - to create a generic object wrapper that handles a variety of different types.
  //   - It's called `NSValue`
  
  // The classes that `NSValue` can store depend on the project you're working with.
  //  - If you're still working with the masOS command-line app template,
  //   - you'll find things like this:
  NSValue *rect = [NSValue
                   valueWithRect:NSMakeRect(0, 0, 10, 10)];
  NSLog(@"1. rect: %@", rect);
  
  NSValue *point2 = [NSValue
                     valueWithPoint:NSMakePoint(0, 0)];
  NSLog(@"- - - - -");
  NSLog(@"2. point: %@", point2);
  
  NSValue *size2 = [NSValue
                    valueWithSize:NSMakeSize(10, 10)];
  NSLog(@"- - - - -");
  NSLog(@"3. size: %@", size2);
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - NSData (p.063)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - NSData (p.063) --- \n");
  
  // `Data` in Swift is effectively identical to the `NSData` class that Objective-C provides.
  
  // Convert an `NSString` value to `NSData`
  NSString* testStr = @"Hello!";
  NSData* data = [testStr dataUsingEncoding:NSUTF8StringEncoding];
  NSLog(@"1a. data: %@", data);
  
  // Convert an `NSData` value to `NSString`
  NSString *testStr2 = [[NSString alloc]
                        initWithData:data encoding:NSUTF8StringEncoding];
  NSLog(@"- - - - -");
  NSLog(@"1b. testStr2: %@", testStr2);
  
  
  // Convert an `ìnt` value fo `NSData`
  int i = 1;
  NSData *data2 = [NSData dataWithBytes: &i length: sizeof(i)];
  NSLog(@"- - - - -");
  NSLog(@"2. data: %@", data2);
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - NSObject (p.064)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - NSObject (p.064) --- \n");
  
  // Objective-C has a universal base class called `NSObject`:
  // - Is where almost every other class inherits from.
  //
  // - Is actually implemented as both a class and a protocol.
  
  // `NSObject` owns the methods `copy` and `mutableCopy`. And other useful methods:
  //
  //  1. Return true if an object is a specific type, or a subclass of that type.
  //
  // - (BOOL)isKindOfClass:(Class)aClass;
  //
  NSMutableArray *people = [@[@"Taylor Swift", @"Adela Adkins"] mutableCopy];
  
  if ([people isKindOfClass:[NSArray class]]) {
    if ([people respondsToSelector:@selector(removeAllObjects)]) {
      [people performSelector:@selector(removeAllObjects)];
    }
  }
  
  // You might be wondering why `performSelector` even exists:
  //  - surely we could have written `[people removeAllObjects]`
  //
  // Objective-C allows you to create selectors from strings
  //  - and effectively choose what code should be called at runtime.
  //
  //  - (id)performSelector:(SEL)aSelector;
  //
  // The `performSelector:method` is equivalent to
  //  - sending an aSelector message directly to the receiver.
  //
  // For example, the following messages all do the same thing:
  //
  id aClone = [NSString copy];
  NSLog(@"1a. aClone: %@", aClone);
  id aClone2 = [NSString performSelector:@selector(copy)];
  NSLog(@"1b. aClone2: %@", aClone2);
  id aClone3 = [NSString performSelector:sel_getUid("copy")];
  NSLog(@"1c. aClone3: %@", aClone3);
  
  // `performSelector:method` is an instance method of `NSObject` class
  //  - that sends a specified message to the receiver and returns the result of the message.
  
  //  - The message is not determined until run-time.
  //   - This means that you can pass a variable selector as the argument:
  //  SEL aSelector = findTheAppropriateSelectorForTheCurrentSituation();
  //  id returnedObject = [anObject performSelector:aSelector];
  
  // This function looks up if there is an implementation present for that class` method call,
  //  - if not, it goes up the chain to superclass,
  //   - until it comes to the root level at `NSObject`
  //    - where it throws an unrecognized selector sent to instance `NSInvalidArgumentException`.
  
  
  // There are a variety of `performSelector` couterparts that are more useful, such as
  //  - `performSelector:withObject:afterDelay`
  //   - these work just the same as in Swift.
  
  
  // 2. Return true if an object declares itself as conforming to a _protocol_
  //
  //  - (BOOL)conformsToProtocol:(Protocol *)protocol;
  //
  //  [MyClass conformsToProtocol:@protocol(MyProtocol)];
  //    - 'respondsToSelector'
  //      - checks whether an object is able to run a method
  //    - 'performSelector'
  //      - runs a method on an object
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - id and instancetype (p.066)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - id and instancetype (p.066) --- \n");
  
  // id is a data type,
  //  - which means "any Objective-C object".
  //
  //  - Is a pointer to any Objective-C objet
  //   - which means you don't need to add '*' to it.
  
  // `Any` from Swift might seem like a good comparison.
  
  // Rather than `id` meaning any object, it in fact means "every object".
  //  - You can call array methods on it, string methods, number methods, and more, and the compiler won't care.
  //   - it will crash at runtime if those methods don't actually exist
  
  
  // This code compiles cleanly bu may have run time errors.
  NSArray *foo = [NSArray new];
  // `bar` looses its type information`.
  id bar = foo;
  NSArray *baz = bar;
  NSLog(@"1. baz number of items: %ld", (long) [baz count]);
  
  
  // As of 2012, coders were able to replace `id` in their initializers with `instancetype`.
  //  - special keyword that means "an instance of this class will be returned"
  //  - This information can then be used by the compiler
  //   - to ensure that new objects are used correctly.
  //
  // + (instancetype)setWithObjects:(ObjectType)firstObj, ...;
  //
  NSSet *set = [NSSet setWithObjects:@"hello", @"world", nil];
  NSLog(@"- - - - -");
  NSLog(@"%@",set);
  
  
  //  - You might find that old classes use `id` and newer ones 'instancetype'
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - NSError (p.068)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - NSError (p.068) --- \n");
  
  // `NSError` is used differently from all the other _data types_.
  //  - It's usage in Swift has dissapeared since Swift 2.0 was released.
  //  - It's used to report errors back from function calls that fail.
  
  
  // `*error` gets created to `nil`
  //  - because this is where we want an error to be placed
  //   - if something went wrong in the following call.
  NSError *error;
  
  // If an error is produced by the method call,
  //  - an `NSError` object is created and placed inside the `error` variable.
  NSString *contents = [NSString
                        stringWithContentsOfFile:@"hello.txt"
                        usedEncoding:nil
                        error:&error];
  
  if (error == nil) {
    NSLog(@"1a. contents: %@", contents);
  }
  else {
    NSLog(@"1b. error: %@", error);
    // Prints out: 1b. error: Error Domain=NSCocoaErrorDomain
    //  Code=260 "The file “hello.txt” couldn’t be opened because there is no such file."
    //  UserInfo={NSFilePath=hello.txt,
    //  NSUnderlyingError=0x1028046b0
    //  {Error Domain=NSPOSIXErrorDomain
    //  Code=2 "No such file or directory"}}
  }
  
  // In early Swift versions, `NSError` was exposed directly to Swift developers.
  //  - Since Swift 2.0 any method that accepts an `NSError*` as its last parameter
  //   - automatically gets converted to use `try/catch` instead.
  //
  //  - On the few occasions when you do see it,
  //   - expect it to be bridged to Swift's `Error` type.
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - Blocks (p.070)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Blocks (p.070) --- \n");
  
  // 1. BLOCK THAT RETURNS NOTHING
  //
  // _Blocks_ are the Objective-C equivalent of Swift's _closures_.
  
  // `void`
  //  - The block returns nothing
  //
  // `^printUniversalGreeting'
  //  - Put the block into a variable called `printUniversalGreeting`
  //
  // `(void)`
  //  - The block accepts no parameters.
  //
  // `= ^{...};`
  //  - The contents of the block
  //
  // You use the `^` operator
  //  - to declare a block variable
  //  - and to indicate the beginning of a block literal.
  //
  void (^printUniversalGreeting) (void) = ^{
    NSLog(@"1. Chao");
  };
  
  printUniversalGreeting();
  //
  //  (void)(NSLog(@"1.b printUniversalGreeting: %@", printUniversalGreeting));
  
  
  // 2. BLOCK THAT RETURNS A STRING
  //
  // We do it just by changing the first `void`
  NSString* (^printUniversalGreeting2) (void) = ^{
    return @"Chao";
  };
  
  //  NSString *universalGreeting2 = printUniversalGreeting2();
  NSLog(@"- - - - -");
  NSLog(@"2. The Universal greeting is: %@", printUniversalGreeting2());
  
  
  // 3. CALLING BLOCKS THAT HAVE PARAMETERS
  //
  // The data type needs to be declared as receiving a string,
  //  - and the block itself needs to be declared as receiving a string.
  
  // `NSString*`
  //  - The block will return a string.
  //
  // `^printUniversalGreeting3`
  //  - Put the block into a variable called `printUniversalGreeting3`
  //
  // `(NSString *)`
  //  - It must accept a string parameter.
  //  - The variable will hold a block that accepts one parameter,
  //   - the parameter doesn't need a name just yet,
  //    - we're just saying that it must exist.
  //
  // `=^`
  //  - Assign the following block to the variable.
  //
  // `(NSString *name)`
  //  - `Parameter list`.
  //   - In this case the block accepts a string parameter.
  //
  NSString* (^printUniversalGreeting3) (NSString *) = ^ (NSString *name) {
    return [NSString stringWithFormat:@"Live long and prosper, %@." , name];
  };
  
  NSLog(@"- - - - -");
  NSLog(@"3. %@", printUniversalGreeting3(@"Jim"));
  
  
  // 4. USE `typedef` TO CREATE AN ALIAS FOR YOUR BLOCK TYPE.
  //
  // Create the _data type_ `MyBlock` as an alias for a block
  //  - that accepts a string and returns a string.
  //
  typedef NSString* (^MyBlock) (NSString*);
  
  MyBlock printUniversalGreeting4 = ^(NSString *name) {
    return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
  };
  
  NSLog(@"- - - - -");
  NSLog(@"4. %@", printUniversalGreeting4(@"Jim"));
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - Blocks - Capturing values (p.073)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Blocks - Capturing values (p.073) --- \n");
  
  // 1. Objective-C _blocks_ capture values similarly to Swift _closures_.
  NSString *name = @"Zaphod";
  
  NSString* (^printUniversalGreeting5) (void) = ^{
    return [NSString stringWithFormat:@"Don't panic, %@!", name];
  };
  
  NSLog(@"1. %@", printUniversalGreeting5());
  // Prints out: 1. Don't panic, Zaphod!
  
  
  // 2. If you want to modify a variable inside your block,
  //  - you should use the `__block` qualifier.
  //
  NSInteger __block number4 = 0;
  
  NSString* (^printMeaningOfLife) (void) = ^{
    number4 = 42;
    return [NSString stringWithFormat:
            @"How many roads must a man walk down? %ld.", number4];
  };
  
  NSLog(@"- - - - -");
  NSLog(@"2. %@", printMeaningOfLife());
  // Prints out: How many roads must a man walk down? 2. 42.
  
  
  
  //  ************************************************************
  //  MARK: CH2 - DATA TYPES - Blocks - Strong reference cycles (p.074)
  //
  
  NSLog(@"\n\n --- CH2 - DATA TYPES - Blocks - Strong reference cycles (p.074) --- \n");
  
  // Blocks can sometimes cause memory problems, just like closures in Swift.
  //  - The problem is identical:
  //   - If a block is owned by object A, and has a strong reference to object A,
  //    - then you have a strong reference cycle.
  //    - Object A can't be freed because its block exists,
  //     - and its block can't be freed because object A exists.
  //    - The solution is identical too:
  //     - make the block have a _WEAK REFERENCE_ to its owner.
  
  // Swift has the edge because they added _CAPTURE LISTS_
  //  - to make _strong reference cycles_ less likely.
  
  //  - Objective-C use a `__weak` qualifier
  
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
//    myViewController * __weak weakSelf = self;
//
//    NSString* (^myBlock) (void) = ^{
//      return [weakSelf runSomeMethod];
//    };
  // * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
  
  
  
  return 0;
}
  
  
