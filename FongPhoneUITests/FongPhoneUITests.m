//
//  FongPhoneUITests.m
//  FongPhoneUITests
//
//  Created by Andrew Allred on 1/9/16.
//
//

#import <XCTest/XCTest.h>
#import "FongPhoneUITests-Swift.h"

@interface FongPhoneUITests : XCTestCase

@end

@implementation FongPhoneUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [Snapshot setupSnapshot:app];
    [app launch];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCUIElementQuery *tabBarsQuery = [[XCUIApplication alloc] init].tabBars;
    
    sleep(3);
    
    [Snapshot snapshot:@"Fongs" waitForLoadingIndicator:NO];
    
    [tabBarsQuery.buttons[@"Sound"] tap];
    sleep(.5);
    [Snapshot snapshot:@"Sound" waitForLoadingIndicator:NO];
    
    [tabBarsQuery.buttons[@"States"] tap];
    sleep(.5);
    
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    [app.tabBars.buttons[@"States"] tap];
//    [[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element pressForDuration:1.6];
//    
//    sleep(.5);
    
    [Snapshot snapshot:@"States" waitForLoadingIndicator:NO];
    
    [tabBarsQuery.buttons[@"Notes/Loops"] tap];
    sleep(.5);
    [Snapshot snapshot:@"Notes" waitForLoadingIndicator:NO];
    
    [[[XCUIApplication alloc] init].staticTexts[@"CLEAR LOOP"] tap];
    
    sleep(1);
    
    [Snapshot snapshot:@"Loops" waitForLoadingIndicator:NO];
    
    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
