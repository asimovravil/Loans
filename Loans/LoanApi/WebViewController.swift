//
//  WebViewController.swift
//  Loans
//
//  Created by Ravil on 08.01.2024.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var url: URL?
    private var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(webView)
        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}

