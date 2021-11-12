//
//  ViewController.swift
//  ViewTest
//
//  Created by Khyeji on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // UIView
        let view1 = UIView()
        view1.frame = CGRect(x: 100, y: 200, width: 200, height: 150)
//        view1.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0, alpha: 1.0)
        view1.backgroundColor = .black
        
        // 메인뷰에 만든 뷰를 포함시켜야 보임
        view.addSubview(view1)
        
        // UILabel
        let frame = CGRect(x: 100, y: 30, width: 200, height: 50)
        let label = UILabel(frame: frame)
        label.backgroundColor = .yellow
        label.text = "이것은 라벨입니다."
        view.addSubview(label)
    }
}

