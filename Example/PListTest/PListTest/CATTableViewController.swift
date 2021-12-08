//
//  CATTableViewController.swift
//  PListTest
//
//  Created by Khyeji on 2021/09/28.
//

import UIKit

class CATTableViewController: UITableViewController {
    var cat:NSArray?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        if let path = Bundle.main.path(forResource: "cat", ofType: "plist") {
            cat = NSArray(contentsOfFile: path)
        }

        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cat = self.cat {
            return cat.count
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if let cat = self.cat {
        
            if let member = cat[indexPath.row] as? [String:String] { 
                if let imageView = cell.viewWithTag(1) as? UIImageView {
                    if let imageName = member["image"] {
                        imageView.image = UIImage(named: imageName)
                    }
                }
                
                if let lblStage = cell.viewWithTag(2) as? UILabel {
                    lblStage.text = member["stage_name"]
                }
                
                if let lblName = cell.viewWithTag(3) as? UILabel {
                    lblName.text = member["name"]
                }
                
                if let lblDetail = cell.viewWithTag(4) as? UILabel {
                    lblDetail.text = "\(indexPath.row+1)번째 고양이"
                }
            }
        }
        
        return cell
    }
}
