//
//  WeekCalculator.swift
//  SemanaBar
//
//  Created by Alex Andrews on 160702.
//  Copyright © 2016 All The Ducks. All rights reserved.
//

import Foundation

struct WeekCalculator{
    
    /// Returns week number for given date (default: current date)
    static func weekNumber(date:Date = Date()) -> Int?{
        let calender = Calendar.current()
        let dateComponent = calender.components(Calendar.Unit.weekOfYear,
                                                from:date)
        return dateComponent.weekOfYear
    }
}
