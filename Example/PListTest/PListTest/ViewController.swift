//
//  ViewController.swift
//  PListTest
//
//  Created by Khyeji on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {
    var cat:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "cat", ofType: "plist") {
            if let cat = NSArray(contentsOfFile: path) {
            
                if let member = cat[0] as? [String:String] {
                    print(member["stage_name"])
                }
            }
        }
    }
}

