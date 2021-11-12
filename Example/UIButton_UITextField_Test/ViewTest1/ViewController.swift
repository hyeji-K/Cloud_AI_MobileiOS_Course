//
//  ViewController.swift
//  ViewTest1
//
//  Created by Khyeji on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {
    var isClicked: Bool = false

    @IBOutlet weak var lblHello: UILabel!
    @IBAction func actOnClick(_ sender: Any) {
        // 버튼이 눌러졌을때 해야할 일을 작성
        isClicked = !isClicked
        if isClicked {
            lblHello.textColor = .red
        } else {
            lblHello.textColor = .blue
        }
    }
    
    @IBOutlet weak var swgment: UISegmentedControl!
    @IBAction func actChangeValue(_ sender: Any) {
        let result = "선택된 segment는 \(swgment.selectedSegmentIndex + 1)번 입니다."
        lblHello.text = result
    }
    
    @IBOutlet weak var tfTest: UITextField!
    @IBAction func onExit(_ sender: Any) {
        // enter 누르면 키보드 내리는 코드
        tfTest.resignFirstResponder()
        lblHello.text = tfTest.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblHello.text = "Hello UIKit"
        lblHello.backgroundColor = .green
    }
}

