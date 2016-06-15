//
//  ViewController.swift
//  LoadWebPagesWtihWebKit
//
//  Created by Mamadou Kaba on 6/15/16.
//  Copyright (c) 2016 Mamadou Kaba. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    //MARK: - Properties
    var webView: WKWebView!
    
    let personalURL = "https://plus.google.com/108755739704023654703/posts"
    let LinkedInURL = "https://www.linkedin.com/in/mamadoukaba"
    let githubURL = "https://github.com/Mamadoukaba"
    
    //MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let preferences = WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        
        webView.navigationDelegate = self
        
        view.addSubview(webView)
        
        webViewLoadURL(personalURL)
        
    }
    
    func webViewLoadURL(urlString: String) {
        if let url = NSURL(string: urlString) {
            let urlRequest = NSURLRequest(URL: url)
            webView.loadRequest(urlRequest)
        }
    }
    
    //MARK: - Target / Action
    @IBAction func menuChanged(sender: UISegmentedControl) {
        let selectedSegment = sender.selectedSegmentIndex
        switch selectedSegment {
        case 0: webViewLoadURL(personalURL)
        case 1: webViewLoadURL(LinkedInURL)
        case 2: webViewLoadURL(githubURL)
        default: break
        }
    }
    
    //MARK: - WKNavigationDelegate
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
}