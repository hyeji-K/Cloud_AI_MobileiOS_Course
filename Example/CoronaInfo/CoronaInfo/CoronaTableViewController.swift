//
//  CoronaTableViewController.swift
//  CoronaInfo
//
//  Created by Khyeji on 2021/10/14.
//

import UIKit
import Alamofire
import SwiftyJSON

class CoronaTableViewController: UITableViewController, UISearchBarDelegate {
    var hospitals: [[String:Any]]?
    let serviceKey = ""

    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let q = searchBar.text {
            search(query: q)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func search(query: String) {
        let strURL = "https://api.odcloud.kr/api/apnmOrg/v1/list"
        let params: Parameters = ["serviceKey": serviceKey, "cond[orgZipaddr::LIKE]": query]
        let request = AF.request(strURL, method: .get, parameters: params)
        request.responseJSON { response in
            // 성공, 실패냐 가 실려옴
            switch response.result {
            case .success(let value):
                let root = JSON(value)
//                print(root)
                self.hospitals = root["data"].arrayObject as? [[String:Any]]
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                if let message = error.errorDescription {
                    print(message)
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let hospitals = self.hospitals {
            return hospitals.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        guard let hospitals = self.hospitals else { return cell }
        let item = hospitals[indexPath.row]
        cell.textLabel?.text = item["orgnm"] as? String

        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let target = segue.destination as? DetailViewController,
           let indexpath = tableView.indexPathForSelectedRow,
           let hospitals = self.hospitals {
            target.hospitals = hospitals[indexpath.row]
        }
        
//        if let indexpath = tableView.indexPathForSelectedRow {
//            if let destVC = segue.destination as? DetailViewController {
//                if let hospitals = self.hospitals {
//                    let item = hospitals[indexpath.row]
//                    destVC.hospitals = item
//                }
//            }
//        }
    }
    

}
