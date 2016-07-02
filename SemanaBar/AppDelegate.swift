//
//  AppDelegate.swift
//  SemanaBar
//
//  Created by Alex Andrews on 160702.
//  Copyright © 2016 All The Ducks. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    // Properties
    var timer: Timer!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    // Everything in (almost) one method
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // Setup status bar item
        statusItem.button!.font = NSFont.menuFont(ofSize: 9)
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit",
                                action:#selector(quit),
                                keyEquivalent: "q"))
        statusItem.menu = menu
        
        // Setup week-checking timer
        timer = Timer.scheduledTimer(timeInterval: 1,
                                     target: self,
                                     selector: #selector(updateWeek),
                                     userInfo: nil,
                                     repeats: true)
        RunLoop.main().add(timer, forMode: RunLoopMode.commonModes)
    }
    
    // Update week value (called via timer)
    @objc func updateWeek() {
        let calender = Calendar.current()
        let dateComponent = calender.components(Calendar.Unit.weekOfYear,
                                                from:Date())
        if let weekNumber = dateComponent.weekOfYear{
            statusItem.button?.title = "\(weekNumber)"
        }else{
            statusItem.button?.title = "...`"
        }
    }
    
    @objc private func quit(sender:AnyObject){
        NSApplication.shared().terminate(sender)
    }
}
