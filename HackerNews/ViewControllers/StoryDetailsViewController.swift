//
//  StoryDetailsViewController.swift
//  HackerNews
//
//  Created by Ajaikumar on 03/12/19.
//  Copyright © 2019 Ajaikumar. All rights reserved.
//

import UIKit
import WebKit

class StoryDetailsViewController: UIViewController {
    
    public var storyURL = String()
    @IBOutlet weak var storyDetailsWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Loading Webview
        if let url = URL(string: storyURL) {
                self.storyDetailsWebView.load(URLRequest(url: url))
        }
    }
}
