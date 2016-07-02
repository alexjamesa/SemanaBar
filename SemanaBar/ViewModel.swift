//
//  ViewModel.swift
//  SemanaBar
//
//  Created by Alex Andrews on 160702.
//  Copyright © 2016 All The Ducks. All rights reserved.
//

import Foundation

protocol ViewModelDelegate : class{
    func weekUpdated(_ week: Int?)
}

class ViewModel{
    
    weak var delegate:ViewModelDelegate?
    var timer: Timer!
    
    init() {
        setupTimer()
    }
    
    func setupTimer(){
        guard timer == nil else{
            print("WARNING: Timer already setup")
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateWeek),
                                     userInfo: nil,
                                     repeats: true)
        RunLoop.main().add(timer, forMode: RunLoopMode.commonModes)
    }
    
    func tearDown(){
        timer.invalidate() // May not be necessary
    }
    
    @objc func updateWeek(){
        let weekNumber = WeekCalculator.weekNumber()
        delegate?.weekUpdated(weekNumber)
    }
}
