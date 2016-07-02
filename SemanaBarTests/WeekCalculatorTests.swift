//
//  WeekCalculatorTests.swift
//  SemanaBar
//
//  Created by Alex Andrews on 160702.
//  Copyright © 2016 All The Ducks. All rights reserved.
//

import XCTest
@testable import SemanaBar

class WeekCalculatorTests: XCTestCase {
    
    func testThatItReturnsWeekNumberForLastMondayOfPreviousYear(){
        let testDay = Calendar.current().date(year:2016, month:1, day:3)
        let weekNumber = WeekCalculator.weekNumber(date: testDay)
        XCTAssertEqual(weekNumber, 53)
    }
    
    func testThatItReturnsWeekNumberForFirstMondayOfYear(){
        let testDay = Calendar.current().date(year:2016, month:1, day:4)
        let weekNumber = WeekCalculator.weekNumber(date: testDay)
        XCTAssertEqual(weekNumber, 1)
    }
    
    func testThatItReturnsWeekNumberForLastSundayOfYear(){
        let testDay = Calendar.current().date(year:2017, month:1, day:1)
        let weekNumber = WeekCalculator.weekNumber(date: testDay)
        XCTAssertEqual(weekNumber, 52)
    }
    
    func testThatItReturnsWeekNumberForFirstMondayOfNextYear(){
        let testDay = Calendar.current().date(year:2017, month:1, day:2)
        let weekNumber = WeekCalculator.weekNumber(date: testDay)
        XCTAssertEqual(weekNumber, 1)
    }
}

extension Calendar{
    func date(year:Int, month:Int, day:Int) -> Date{
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return self.date(from: components)!
    }
}
