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
        loadUrl("https://trello.com")
    }
    
    @IBAction func doRefresh(AnyObject) {
        webView.reload(self)
    }
    
    func loadUrl(url:NSString) {
        let nsurl = NSURL(string: url)
        let request = NSURLRequest(URL: nsurl!)
        webView.mainFrame.loadRequest(request)
    }

}