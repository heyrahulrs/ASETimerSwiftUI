//
//  ASETimerTests.swift
//  ASETimerTests
//
//  Created by Rahul Sharma on 04/06/22.
//  Copyright © 2022 Rahul Sharma. All rights reserved.
//

import XCTest

@testable import ASE_Timer
class ASETimerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testEventDescriptionInIST() {
        // given
        let event = Event()
        
        // when
        let description = event.description
        
        // then
        let expected = "Watch on June 6 at 10:30 PM IST.\nView online at apple.com or on the Apple TV app."
        XCTAssertEqual(description, expected)
    }
    
    func testEventDescriptionInPST() {
        // given
        var event = Event()
        
        // when
        event.timeZone = TimeZone(abbreviation: "PDT")!
        let description = event.description
        
        // then
        let expected = "Watch on June 6 at 10:00 AM PDT.\nView online at apple.com or on the Apple TV app."
        XCTAssertEqual(description, expected)
    }
    
    func testTimeRemaining() {
        // given
        let eventManager = EventManager()
        eventManager.endTimer()
        
        // when
        eventManager.remainingSeconds = 3722
        
        // then
        let expectedTime = Time(days: 0, hours: 1, minutes: 2, seconds: 2)
        XCTAssertEqual(eventManager.remainingTime.days, expectedTime.days)
        XCTAssertEqual(eventManager.remainingTime.hours, expectedTime.hours)
        XCTAssertEqual(eventManager.remainingTime.minutes, expectedTime.minutes)
        XCTAssertEqual(eventManager.remainingTime.seconds, expectedTime.seconds)
    }

}
