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
    
    @IBOutlet weak var progressIndicator: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.policyDelegate = self
        webView.frameLoadDelegate = self
        goHome(self)
    }
    
    @IBAction func goHome(AnyObject) {
        loadUrl("https://trello.com")
    }
    
    @IBAction func doRefresh(AnyObject) {
        webView.reload(self)
    }
    
    func loadUrl(url:String) {
        webView.mainFrameURL = url
    }
    
    func loadExternalUrl(url:String) {
        NSWorkspace.sharedWorkspace().openURL(NSURL(string: url)!)
    }
    
    override func webView(sender: WebView!, didStartProvisionalLoadForFrame frame: WebFrame!) {
        progressIndicator.startAnimation(self)
    }
    
    override func webView(sender: WebView!, didFinishLoadForFrame frame: WebFrame!) {
        progressIndicator.stopAnimation(self)
    }
    
    override func webView(sender: WebView!, decidePolicyForNavigationAction actionInformation: [NSObject : AnyObject]!, request: NSURLRequest!, frame: WebFrame!, decisionListener listener: WebPolicyDecisionListener!) {
        if (sender.isEqual(webView)) {
            listener.use()
        } else {
            let index = actionInformation.indexForKey(WebActionOriginalURLKey)!
            let pair = actionInformation[index]
            let url = pair.1.debugDescription! // TODO: Figure out how to convert this into a string properly
            loadExternalUrl(url)
            listener.ignore()
        }
    }
    
    override func webView(webView: WebView!, decidePolicyForNewWindowAction actionInformation: [NSObject : AnyObject]!, request: NSURLRequest!, newFrameName frameName: String!, decisionListener listener: WebPolicyDecisionListener!) {
        let index = actionInformation.indexForKey(WebActionOriginalURLKey)!
        let pair = actionInformation[index]
        let url = pair.1.debugDescription! // TODO: Figure out how to convert this into a string properly
        loadExternalUrl(url)
        listener.ignore()
    }
}