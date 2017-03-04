//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Rajat Gupta on 05/03/17.
//  Copyright © 2017 Rajat Gupta. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKNavigationDelegate {
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "https://www.google.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title:
            "Open", style: .plain, target: self, action:
            #selector(openTapped))
        
    }
    
    func openTapped() {
    let ac = UIAlertController(title: "Open page...", message:nil, preferredStyle: .actionSheet)
    ac.addAction(UIAlertAction(title: "apple.com",style: .default, handler: openPage))
    ac.addAction(UIAlertAction(title: "hackingwithswift.com",style: .default, handler: openPage))
    ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
    present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction!) {
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }

    


}

