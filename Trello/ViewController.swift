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
        goHome(self)
    }
    
    @IBAction func goHome(AnyObject) {
        let url = NSURL(string: "https://trello.com")
        let request = NSURLRequest(URL: url!)
        webView.mainFrame.loadRequest(request)
    }
    
    @IBAction func doRefresh(AnyObject) {
        webView.reload(self)
    }

}