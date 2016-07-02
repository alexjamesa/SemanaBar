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

    let viewModel = ViewModel()
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        viewModel.delegate = self
        setupMenu()
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        viewModel.tearDown()
    }
    
    private func setupMenu(){
        statusItem.button!.font = NSFont.menuFont(ofSize: 9)
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit",
                                action:#selector(quit),
                                keyEquivalent: "q"))
        statusItem.menu = menu
    }
    
    @objc private func quit(sender:AnyObject){
        NSApplication.shared().terminate(sender)
    }
}


extension AppDelegate: ViewModelDelegate{
    
    /// Update display to newest week number
    func weekUpdated(_ week: Int?) {
        statusItem.button?.title = week != nil ? "\(week!)" : ".."
    }
}
