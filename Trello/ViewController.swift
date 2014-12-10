//
//  ViewController.swift
//  Trello
//
//  Created by John W. Long on 12/9/14.
//  Copyright (c) 2014 John W. Long. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet var webView: WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "https://trello.com")
        let request = NSURLRequest(URL: url!)
        webView.mainFrame.loadRequest(request)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    


}