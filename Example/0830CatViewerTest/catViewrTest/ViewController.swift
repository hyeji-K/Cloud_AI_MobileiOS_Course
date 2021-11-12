//
//  ViewController.swift
//  catViewrTest
//
//  Created by Khyeji on 2021/09/01.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 0
    let cat = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6", "cat7"]
    let catName = ["브숏", "메이쿤", "시암", "페르시안", "렉돌", "벵골", "코숏"]

    @IBOutlet weak var lblLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBAction func actPrevButton(_ sender: Any) {
        index -= 1
        if index < 0 {
            index = 0
        }
        let imageName = cat[index]
        let image = UIImage(named: imageName)
        imageView.image = image
        lblLabel.text = catName[index]
        pageControl.currentPage = index
    }
    
    @IBAction func actNextButton(_ sender: Any) {
        index += 1
        if index > cat.count-1 {
            index = cat.count-1
        }
        let imageName = cat[index]
        let image = UIImage(named: imageName)
        imageView.image = image
        lblLabel.text = catName[index]
        pageControl.currentPage = index
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let imageName = cat[index]
        let image = UIImage(named: imageName)
        imageView.image = image
        pageControl.numberOfPages = cat.count
    }
}

