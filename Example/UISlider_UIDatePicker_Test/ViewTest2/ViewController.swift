//
//  ViewController.swift
//  ViewTest2
//
//  Created by Khyeji on 2021/08/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var outSlider: UISlider!
    @IBAction func actSlider(_ sender: Any) {
        lblLabel.text = "\(outSlider.value)"
    }
    
    @IBOutlet weak var outSwitch: UISwitch!
    @IBAction func actSwitch(_ sender: Any) {
        if outSwitch.isOn {
            lblLabel.text = "켜졌습니다"
        } else {
            lblLabel.text = "꺼졌습니다"
        }
    }
    
    @IBOutlet weak var sw2: UISwitch!
    @IBAction func actSw2(_ sender: UISwitch) {
        if sw2.isOn {
            lblLabel.text = "켜졌습니다"
        } else {
            lblLabel.text = "꺼졌습니다"
        }
    }
    
    @IBOutlet weak var step: UIStepper!
    @IBAction func actStep(_ sender: UIStepper) {
        lblLabel.text = "\(sender.value)"
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func actDatePicker(_ sender: Any) {
        let date = datePicker.date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        lblLabel.text = formatter.string(from: date)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        step.minimumValue = 0
        step.maximumValue = 10
        step.stepValue = 0.2
        step.value = 0
    }
}

