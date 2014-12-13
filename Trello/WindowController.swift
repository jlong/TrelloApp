//
//  WindowController.swift
//  Trello
//
//  Created by John W. Long on 12/12/14.
//  Copyright (c) 2014 John W. Long. All rights reserved.
//

import Cocoa
import WebKit

class WindowController: NSWindowController {

    @IBOutlet weak var addressBar: NSTextField!
    
    override func windowDidLoad() {
        window?.titleVisibility = .Hidden
    }
    
}