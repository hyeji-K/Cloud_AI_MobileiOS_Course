//
//  MainTableViewController.swift
//  BookFinder
//
//  Created by Khyeji on 2021/09/30.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {
    let apiKey = "KakaoAK "
    var books:[[String:Any]]?
    // 페이지 관리
    var page = 1

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else { return }
        search(query: query, page: 1)
        searchBar.resignFirstResponder()
    }
    
    func dataTaskHandler(data: Data?, response: URLResponse?, error: Error?) {
        guard let rdata = data else { return }
        do {
            if let dic = try JSONSerialization.jsonObject(with: rdata, options: []) as? [String:Any] {
                books = dic["documents"] as? [[String:Any]]
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        } catch {
            print("실패")
        }
    }
    
    func search(query: String, page: Int) {
        let strURL = "https://dapi.kakao.com/v3/search/book?query=\(query)&page=\(page)" as NSString
        guard let str = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        
        guard let url = URL(string: str) else { return }
        var request = URLRequest(url: url)
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: dataTaskHandler)
        dataTask.resume()
    }
    
    @IBAction func actNext(_ sender: Any) {
        page += 1
        guard let query = searchBar.text else { return }
        search(query: query, page: page)
    }
    
    @IBAction func actPrev(_ sender: Any) {
        page -= 1
        guard let query = searchBar.text else { return }
        search(query: query, page: page)
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let books = self.books {
            return books.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let imageView = cell.viewWithTag(1) as? UIImageView
        let titleLabel = cell.viewWithTag(2) as? UILabel
        let authorsLabel = cell.viewWithTag(3) as? UILabel
        let priceLabel = cell.viewWithTag(4) as? UILabel
        let contentsLabel = cell.viewWithTag(5) as? UILabel
        
        guard let books = self.books else { return cell }
        let book = books[indexPath.row]
        let title = book["title"] as? String
        titleLabel?.text = title
        if let authors = book["authors"] as? Array<String> {
            authorsLabel?.text = authors.joined(separator: ",")
        }
        
        let price = book["price"] as! Int
        priceLabel?.text = "\(price)원"
        let contents = book["contents"] as? String
        contentsLabel?.text = contents
        
        if let imageURL = book["thumbnail"] as? String,
           let url = URL(string: imageURL) {
            do {
                let data = try Data(contentsOf: url)
                let cover = UIImage(data: data)
                imageView?.image = cover
            } catch {
                print("thumbnail down failed")
            }
        }
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destVC = segue.destination as? DetailViewController,
              let indexPath = tableView.indexPathForSelectedRow,
              let books = self.books
              else { return }
        
        let book = books[indexPath.row]
        
        destVC.strURL = book["url"] as? String
    }
}
