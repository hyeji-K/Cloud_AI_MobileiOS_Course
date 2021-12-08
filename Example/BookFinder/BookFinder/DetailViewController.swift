//
//  DetailViewController.swift
//  BookFinder
//
//  Created by Khyeji on 2021/09/30.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var strURL:String?

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let str = strURL,
              let url = URL(string: str)
        else { return }
        
        let request = URLRequest(url: url)
        
        webView.load(request)   
    }
}
