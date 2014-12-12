//
//  AppDelegate.swift
//  Trello
//
//  Created by John W. Long on 12/9/14.
//  Copyright (c) 2014 John W. Long. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    func applicationWillFinishLaunching(notification: NSNotification?) {
        let manager:NSAppleEventManager = NSAppleEventManager.sharedAppleEventManager()
        manager.setEventHandler(self, andSelector: "applicationHandleUrl:withReplyEvent:", forEventClass: AEEventClass(kInternetEventClass), andEventID: AEEventID(kAEGetURL))
    }
    
    func applicationDidBecomeActive(notification: NSNotification) {
        let app = notification.object as NSApplication
        window = app.mainWindow
    }
    
    func applicationHandleUrl(event: NSAppleEventDescriptor, withReplyEvent replyEvent:NSAppleEventDescriptor) {
        let url = event.paramDescriptorForKeyword(AEKeyword(keyDirectObject))?.stringValue
        
        if (window != nil) {
            let vc = window.contentViewController as ViewController
            vc.loadUrl(url!)
        } else {
            println("nil window!")
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(sender: NSApplication) -> Bool {
        return true
    }

}