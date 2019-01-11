//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Yunier Alvarez on 10/20/18.
//  Copyright © 2018 Yunier Alvarez. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func loadWebView() {
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
